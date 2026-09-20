//
//  AboutView.swift
//  ExcalidrawZ
//
//  Created by Dove Zachary on 2024/9/7.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        if #available(macOS 13.0, *) {
            Form {
                content()
                developerSection()
            }
            .formStyle(.grouped)
        } else {
            AnyView(
                ScrollView {
                    VStack(spacing: 14) {
                        VStack(spacing: 6) {
                            content()
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(editorChromeSurface())
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray.opacity(0.7))
                        }
                        developerSection()
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(editorChromeSurface())
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.gray.opacity(0.7))
                            }
                    }
                    .padding()
                }
            )
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        Section {
            HStack {
                Text(.localizable(.settingsAboutVersion))
                Spacer()
                Text(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text(.localizable(.settingsAboutBuild))
                Spacer()
                Text(Bundle.main.infoDictionary!["CFBundleVersion"] as! String)
                    .foregroundColor(.secondary)
            }
        } header: {
            HStack {
                Spacer(minLength: 0)
                VStack(spacing: 0) {
                    Image("AppIcon-macOS")
                        .resizable()
                        .frame(width: 128, height: 128)
                    Text(Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer(minLength: 0)
            }
            .padding(.bottom)
        }
    }

    @ViewBuilder
    private func developerSection() -> some View {
        Section {
            Link(destination: URL(string: "https://github.com/dp466")!) {
                HStack(spacing: 10) {
                    Image("github-mark")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("dp466")
                            .font(.headline)
                        Text("github.com/dp466")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .buttonStyle(.plain)
        } header: {
            Text("Developer")
        }
    }
    
    @ViewBuilder
    private func licenseView() -> some View {
        let license = """
MIT License

Copyright (c) 2020 Excalidraw

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""
        VStack {
            Text(license)
        }
    }
}

#Preview {
    AboutView()
}
