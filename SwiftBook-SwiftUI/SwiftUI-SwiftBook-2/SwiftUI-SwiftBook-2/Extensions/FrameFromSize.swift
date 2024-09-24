//
//  FrameFromSize.swift
//  SwiftUI-SwiftBook-2
//
//  Created by Азат Зиганшин on 18.08.2024.
//

import Foundation
import SwiftUI

extension View {
    func frame(size: CGSize) -> some View {
        modifier(FrameFromSizeModifier(size: size))
    }
}
