//
//  SidebarRowModifier.swift
//  ExcalidrawZ
//
//  Created by Dove Zachary on 8/12/25.
//

import SwiftUI
import ChocofordUI

struct ExcalidrawZSidebarRowModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    var isSelected: Bool
    var isMultiSelected: Bool
    var isPressed: Bool = false
    
    @State private var isHovered = false

    private var isActive: Bool {
        isHovered || isSelected || isPressed
    }

    private let cornerRadius: CGFloat = 6

    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .foregroundStyle(
            isActive
            ? NavigationShellTheme.primary(for: colorScheme)
            : Color.primary
        )
        .contentShape(Rectangle())
        .onHover { hovering in
            self.isHovered = hovering
        }
        .background(rowBackground)
        .padding(.vertical, 1)
        .overlay {
            if isMultiSelected {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(NavigationShellTheme.primary(for: colorScheme), lineWidth: 1.5)
            }
        }
        .animation(.easeInOut(duration: 0.16), value: isActive)
    }

    @ViewBuilder
    private var rowBackground: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(
                isSelected
                ? NavigationShellTheme.selection(for: colorScheme)
                : NavigationShellTheme.hover(for: colorScheme)
            )
            .opacity(isActive ? (isPressed ? 0.82 : 1) : 0)
    }
}


struct ExcalidrawZSidebarRowButtonStyle: ButtonStyle {
    var isSelected: Bool
    var isMultiSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ExcalidrawZSidebarRowModifier(
                isSelected: isSelected,
                isMultiSelected: isMultiSelected,
                isPressed: configuration.isPressed
            ))
    }
}
 
extension ButtonStyle where Self == ExcalidrawZSidebarRowButtonStyle {
    static func excalidrawSidebarRow(
        isSelected: Bool,
        isMultiSelected: Bool
    ) -> ExcalidrawZSidebarRowButtonStyle {
        ExcalidrawZSidebarRowButtonStyle(
            isSelected: isSelected,
            isMultiSelected: isMultiSelected
        )
    }
}
