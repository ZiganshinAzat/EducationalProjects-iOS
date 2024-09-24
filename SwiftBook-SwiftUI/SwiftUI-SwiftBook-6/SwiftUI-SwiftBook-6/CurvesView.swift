//
//  CurvesView.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct CurvesView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)

            Path { path in
                path.move(to: CGPoint(x: size * 0.5, y: size * 0.1))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.9, y: size * 0.5),
                    control: CGPoint(x: size, y: 0)
                )
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.5, y: size * 0.9),
                    control: CGPoint(x: size, y: size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.1, y: size * 0.5),
                    control: CGPoint(x: 0, y: size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.5, y: size * 0.1),
                    control: CGPoint(x: 0, y: 0)
                )
            }
            .fill(
                RadialGradient(
                    colors: [.blue, .purple],
                    center: .center,
                    startRadius: size * 0.01,
                    endRadius: size * 0.6
                )
            )

            Path { path in
                path.addArc(
                    center: CGPoint(x: size * 0.1, y: size * 0.1),
                    radius: size * 0.5,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: size * 0.9, y: size * 0.1),
                    radius: size * 0.5,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: size * 0.9, y: size * 0.9),
                    radius: size * 0.5,
                    startAngle: .degrees(270),
                    endAngle: .degrees(180),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: size * 0.1, y: size * 0.9),
                    radius: size * 0.5,
                    startAngle: .degrees(0),
                    endAngle: .degrees(270),
                    clockwise: true
                )
                path.closeSubpath()
            }
            .stroke(Color.red, lineWidth: 4)
        }
    }
}

#Preview {
    CurvesView()
        .frame(width: 300, height: 300)
}
