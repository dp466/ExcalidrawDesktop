# Package validation

Validated 2026-09-17.

## Completed checks

- Parsed SKILL.md front matter and agents/openai.yaml.
- Checked skill name, folder name, description size and display name.
- Confirmed bundled reference, image and script files exist.
- Opened the four appearance references for visual review.
- Parsed eleven structured acceptance scenarios; checked the example rack map
  contains twelve positions, seven breakers and five blanks.
- Compiled the PNG checker and tested five runtime cases: valid transparent PNG,
  opaque PNG, empty transparent PNG, non-PNG file and nonexistent file.
- Ran the checker on the three bundled PNG style references and confirmed real
  transparency. The remaining JPEG is explicitly a style preview only.
- Confirmed the ZIP contains one skill folder and no absolute paths, font files,
  executables, API credentials or transcript exports.

## Limits

The acceptance scenarios are regression specifications, not a completed
image-generation benchmark. No new image was generated to validate this skill,
and it has not been installed or invoked through the user's skill selector in
this session. Import compatibility is based on the documented skill format,
not a completed account-side import.

Generated pictures still require visual review. The helper cannot validate
terminal count, ratings, manufacturer authenticity or electrical safety.
Bundled sample graphics are appearance references, not verified wiring plans.
