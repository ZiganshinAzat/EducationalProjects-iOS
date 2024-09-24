//
//  TextExtension.swift
//  SwiftUI-SwiftBook-2
//
//  Created by Азат Зиганшин on 18.08.2024.
//

import Foundation
import SwiftUI

extension Text {
    func applyAppTextStyle() -> some View {
        modifier(AppTextStyleModifier())
    }
}
