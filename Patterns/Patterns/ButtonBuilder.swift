//
//  ButtonBuilder.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import Foundation
import UIKit

class ButtonBuilder {

    private var title: String?
    private var backgroundColor: UIColor?
    private var cornerRadius: CGFloat?
    private var borderWidth: CGFloat?

    func addTitle(_ title: String) -> Self {
        self.title = title
        return self
    }

    func addBackgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }

    func addCornerRadius(_ radius: CGFloat) -> Self {
        self.cornerRadius = radius
        return self
    }

    func addCornerWidth(_ width: CGFloat) -> Self {
        self.borderWidth = width
        return self
    }

    func buildButton() -> UIButton {

        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius ?? 0
        button.layer.borderWidth = borderWidth ?? 0

        return button
    }
}
