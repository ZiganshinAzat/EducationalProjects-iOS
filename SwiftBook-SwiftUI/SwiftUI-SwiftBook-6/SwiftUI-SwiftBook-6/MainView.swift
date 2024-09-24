//
//  MainVIew.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false

    var body: some View {
        VStack {
            Button(action: buttonAction, label: {
                HStack {
                    Text("\(awardIsShowing ? "Hide Award" : "Show Award")")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(awardIsShowing ? 2 : 1)
                        .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
//                        .animation(.default, value: awardIsShowing)
                }
            })
            Spacer()
            if awardIsShowing {
                GradientRectangles()
                    .frame(width: 300, height: 300)
//                    .transition(.move(edge: .leading))
                    .transition(.customTransition)
    //                .offset(x: awardIsShowing ? 0 : -UIScreen.main.bounds.width)
    //                .animation(.default, value: awardIsShowing)
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }

    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

#Preview {
    MainView()
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
