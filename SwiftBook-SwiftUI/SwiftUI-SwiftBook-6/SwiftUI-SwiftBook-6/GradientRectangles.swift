//
//  GradientRectangles.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct GradientRectangles: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<3) { iteration in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.yellow, .red],
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0)
                            )
                        )
                        .scaleEffect(0.7)
                        .rotationEffect(.degrees(Double(60 * iteration)))
                }

                Image(systemName: "airplane")
                    .resizable()
                    .rotationEffect(.degrees(-90))
                    .opacity(0.7)
                    .scaleEffect(0.7)
            }
        }
    }
}

#Preview {
    GradientRectangles()
        .frame(width: 300, height: 300)
}
