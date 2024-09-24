//
//  ColorCircleView.swift
//  SwiftUI-SwiftBook
//
//  Created by Азат Зиганшин on 17.08.2024.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color

    var body: some View {
        Circle()
            .foregroundStyle(color)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
    }
}

#Preview {
    ColorCircleView(color: .red)
}
