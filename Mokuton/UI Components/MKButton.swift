//
//  MKButton.swift
//  Mokuton
//
//  Created by Christianto Budisaputra on 08/02/22.
//

import SwiftUI

public struct MKButton: View {

    private var title: String
    private var type: MKButtonType
    private var size: MKBUttonSize
    private var padding: MKButtonPadding
    private var action: MKButtonAction?

    public init(
        title: String,
        type: MKButtonType = .primary,
        padding: MKButtonPadding = .medium,
        size: MKBUttonSize = .fits,
        action: MKButtonAction? = nil) {
            self.title = title
            self.type = type
            self.padding = padding
            self.size = size
            self.action = action
        }

    public var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                if size == .expands { Spacer() }
                Text(title).bold()
                if size == .expands { Spacer() }
            }
            .padding(.horizontal, padding.horizontalValue)
            .padding(.vertical, padding.verticalValue)
        }
        .foregroundColor(type.foregroundColor)
        .background(type.backgroundColor)
        .cornerRadius(10)
    }

    public func withShadow() -> some View {
        self.shadow(color: .primary.opacity(0.075), radius: 3, x: 4, y: 4)
    }
}

extension MKButton {
    public typealias MKButtonAction = () -> Void

    public enum MKBUttonSize {
        case fits, expands
    }

    public enum MKButtonPadding {
        case small, medium, large

        var horizontalValue: CGFloat {
            switch self {
            case .small: return 8
            case .medium: return 48
            case .large: return 120
            }
        }

        var verticalValue: CGFloat {
            switch self {
            case .small: return 4
            case .medium: return 12
            case .large: return 16
            }
        }
    }

    public enum MKButtonType {
        case primary, secondary

        var foregroundColor: Color {
            switch self {
            case .primary: return .white
            case .secondary: return .accentColor
            }
        }

        var backgroundColor: Color {
            switch self {
            case .primary: return .accentColor
            case .secondary: return .white
            }
        }
    }
}

struct MKButton_Previews: PreviewProvider {
    static var previews: some View {
        MKButton(title: "Apply", type: .primary) {
            // Action
        }
        .withShadow()
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
