//
//  PathView.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)

            Path { path in
                path.move(to: CGPoint(x: size * 0.6, y: size * 0.1))
                path.addLine(to: CGPoint(x: size * 0.9, y: size * 0.9))
                path.addLine(to: CGPoint(x: size * 0.1, y: size * 0.9))
                path.addLine(to: CGPoint(x: size * 0.4, y: size * 0.1))
            }
            .fill(
                Color(Color(red: 0.4, green: 0.4, blue: 0.4))
            )

            Path { path in
                path.move(to: CGPoint(x: size * 0.5, y: size * 0.1))
                path.addLine(to: CGPoint(x: size * 0.5, y: size * 0.9))
            }
            .stroke(Color.white, style: StrokeStyle(lineWidth: 3, dash: [size * 0.07]))

            Image(systemName: "car.fill")
                .resizable()
                .foregroundStyle(.white)
                .scaleEffect(size * 0.001)
                .offset(x: -size / 7.25)
        }
    }
}

#Preview {
    PathView()
        .frame(width: 200, height: 200)
}

