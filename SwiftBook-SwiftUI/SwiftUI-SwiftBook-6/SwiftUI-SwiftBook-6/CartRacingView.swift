//
//  CartRacingView.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct CartRacingView: View {
    @State private var start = false

    var body: some View {
        HStack {
            VStack {
                CartView(
                    start: $start,
                    cartTitle: "Default",
                    color: .red,
                    animation: .default
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseOut",
                    color: .green,
                    animation: .easeOut(duration: 2)
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseIn",
                    color: .blue, 
                    animation: .easeIn
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseInOut",
                    color: .yellow,
                    animation: .easeInOut
                        .repeatCount(3, autoreverses: true)
                )
                CartView(
                    start: $start,
                    cartTitle: "InterpolatingSpring",
                    color: .brown,
                    animation: .interpolatingSpring(
                        mass: 1,
                        stiffness: 100,
                        damping: 10,
                        initialVelocity: 0
                    )
                    .speed(3)
                )
                CartView(
                    start: $start,
                    cartTitle: "Spring",
                    color: .orange,
                    animation: .spring(
                        response: 0.55,
                        dampingFraction: 0.45,
                        blendDuration: 0
                    )
                    .delay(1)
                )
            }
            Spacer()
        }
        .onTapGesture {
            start.toggle()
        }
    }
}

#Preview {
    CartRacingView()
}


struct CartView: View {
    @Binding var start: Bool

    let cartTitle: String
    let color: Color
    let animation: Animation

    var body: some View {
        VStack {
            Image(systemName: "cart.fill")
                .font(.title)
                .foregroundStyle(color)
                .offset(x: start ? UIScreen.main.bounds.width - 200 : 0)
                .animation(animation, value: start)
            Text(cartTitle)
        }
    }
}
