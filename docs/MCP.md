# Diagram control with Codex and Claude Code

ExcalidrawDesktop exposes an authenticated local Streamable HTTP MCP endpoint at
`http://127.0.0.1:8490/mcp`. Keep the app open. Choose **Complete** under
Settings → MCP for document addressing, revision checks, atomic edits,
layout, previews, export and recovery. Existing Basic and Optimized settings are
preserved; new installations default to Complete. Hosted AI chat is not required.

## Connect Codex

1. Enable the MCP server in ExcalidrawDesktop and wait for **Running**.
2. Under **Client access**, create a **Codex** credential.
3. Use **Copy private config** on that client. Paste the copied TOML into your
   user `config.toml`, normally `~/.codex/config.toml`.
4. Reload the Codex MCP connection. In the CLI, `codex mcp list` shows configured
   servers and `/mcp` in an interactive session shows connection details.

The copied configuration connects directly; no Node.js proxy is needed:

```toml
[mcp_servers.excalidrawdesktop]
url = "http://127.0.0.1:8490/mcp"
http_headers = { Authorization = "Bearer <PRIVATE_TOKEN>" }
```

The placeholder above is explanatory. The copy action includes the private token
for that client. Keep that configuration in your user settings. Codex also
supports `bearer_token_env_var` if you manage tokens through your environment.
See the [official Codex MCP configuration guide](https://learn.chatgpt.com/docs/extend/mcp?surface=cli).

## Connect Claude Code

1. Create a separate **Claude Code** credential under **Client access**.
2. Use **Copy private config** and run the copied command in Terminal:

```sh
claude mcp add --transport http --scope user excalidrawdesktop http://127.0.0.1:8490/mcp --header 'Authorization: Bearer <PRIVATE_TOKEN>'
```

3. Run `claude mcp list`, then inspect `/mcp` in a Claude Code session.

The copied command contains that client's private token. This installs the
connection in user scope. See the [official Claude Code MCP guide](https://code.claude.com/docs/en/mcp).

## Check a connection and revoke access

- `GET /health` returns only `{"status":"ok"}` while the server listens. It does
  not disclose documents, credentials or activity. `GET /mcp` returns 405; use an
  MCP client to POST protocol requests.
- Connection refused: verify the app is open and the status is Running. Starting
  is shown until the socket has actually begun listening; a port conflict is a
  startup failure.
- HTTP 401: copy the configuration for an existing client or create a new
  credential. Revoked tokens remain invalid after restarting the app.
- HTTP 403: the request's Host or Origin is outside the loopback allowlist.
- HTTP 503: Keychain access is unavailable; unlock the Mac before retrying.
- **Revoke** deletes a client's Keychain credential and cancels its in-flight
  commands. A commit already completed remains visible and recoverable through
  history/checkpoints. Other clients retain access.
- The editor displays a visible MCP readiness/activity badge; settings show the
  active command count and tool name. Arguments and credential values are not
  included in the activity indicators.

## Diagram workflow

Start with `get_app_context`, `get_capabilities` and `read_me`. Choose an explicit
`document_id` and, when multiple windows match, a `window_id`. Read the current
revision before editing. Mutations use a unique `request_id` and the
`expected_revision`. Reuse an ID only when retrying identical arguments.

Create/edit → analyze → render → inspect the image → refine → save/export.
After a revision conflict, reread and recompute the intended edit. After a save
failure, flush/save the changed document instead of repeating the edit.

## Protocol and compatibility

The server supports modern MCP **2026-07-28** per-request metadata and the
initialization-based revisions **2025-11-25**, **2025-06-18** and **2025-03-26**.
Modern requests require `params._meta` containing
`io.modelcontextprotocol/protocolVersion` and
`io.modelcontextprotocol/clientCapabilities`. Mirror the version and method in
`MCP-Protocol-Version` and `Mcp-Method`; `tools/call` also requires `Mcp-Name`.
`server/discover` reports implemented capabilities. Modern results include
`resultType: "complete"`, server identity metadata, `ttlMs: 0` and
`cacheScope: "private"`. Discovery/catalog results satisfy the modern cache
schema; the zero TTL keeps changing app/document access immediately stale and
the private scope prevents reuse across credentials.

Legacy clients initialize first, receive the selected supported legacy version,
then send `notifications/initialized`. Notifications receive HTTP 202 with an
empty body. Legacy HTTP handling is stateless: subsequent requests select their
supported revision through `MCP-Protocol-Version`; requests omitting that header
use the specified `2025-03-26` compatibility default. Different processes may
reuse a credential without replacing another process's negotiated revision.
No protocol session ID is issued. No standalone GET event stream,
subscriptions, sampling, elicitation or resource subscriptions are advertised.

POST requests require `Content-Type: application/json`, `Accept: application/json,
text/event-stream`, and `Authorization: Bearer …`. Tool calls return a
request-scoped SSE response; a requested `progressToken` gets start/completion
notifications. Keep-alives allow a broken socket to be observed within roughly
five seconds while a command waits. Legacy cancellation notifications also
cancel the corresponding client/request. Cancellation is checked before work;
an atomic commit already completed is not rolled back by a lost connection.

Input is read in chunks with a 16 MiB limit. At most eight tool requests can be
in flight. Tool arguments are validated against the bounded local JSON Schema
2020-12 subset emitted by the catalogs; external schema references are never
fetched. Canonical Excalidraw element dictionaries retain extension fields.

The server binds only to `127.0.0.1`, validates Host and Origin, and uses a
separate revocable random Keychain token per client. Authentication identity,
including retry receipt ownership, comes from the credential rather than
client-supplied metadata. App document locks and approved local folder access
still apply. Remote access, headless operation and shared collaboration rooms
are outside this integration.

The local macOS build stores generic passwords in the encrypted login Keychain.
The native unsigned-host test returned `errSecMissingEntitlement` (-34018) for
the Data Protection Keychain, so the Mac implementation uses its login Keychain
without a plaintext fallback. Request authentication disallows interactive
authentication. Apple's [macOS Keychain API guide](https://developer.apple.com/documentation/technotes/tn3137-on-mac-keychains)
describes the two implementations and their signing requirements.

Protocol references: [modern Streamable HTTP](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http),
[modern schema](https://github.com/modelcontextprotocol/modelcontextprotocol/blob/main/schema/2026-07-28/schema.ts),
[legacy lifecycle](https://modelcontextprotocol.io/specification/2025-11-25/basic/lifecycle).

## Real-client acceptance harness

After building a native/editor test snapshot, run
`script/acceptance_mcp_clients.sh` with its `NATIVE_SOURCE_ROOT`, `DERIVED` and
`PACKAGES` paths. This explicitly gated XCTest hosts a real native canvas, full
router and local HTTP endpoint on **127.0.0.1:18490** for up to 20 minutes. The
normal test run does not start this endpoint. The harness uses in-memory Core
Data, a linked folder under `/private/tmp/full-mcp-validation/documents`, and
two random in-memory credentials; it never provisions Keychain clients or
changes the user's MCP configuration.

Wait for `/private/tmp/full-mcp-validation/ready.json`. It includes the endpoint,
loaded document handle and approved `local_folder_id`. A separate private
`client-config.json` (directory mode 700, file mode 600) contains `url` and
`clients.codex.token` / `clients.claudeCode.token`; consume those into temporary
client configurations without printing the tokens. Keep all created documents
in that approved folder. Run each installed CLI against this endpoint with its
own temporary configuration, complete the create → revise → render → undo /
checkpoint restore → save/reopen → export workflow, and record the results.
Write the `finished` flag named in `ready.json` when both workflows have ended.
The harness then closes the endpoint and removes its token/configuration and
readiness files. Diagram/export fixtures remain available for inspection.

Starting the harness alone does not establish client acceptance; both CLI
workflows and their artifacts must be checked.
