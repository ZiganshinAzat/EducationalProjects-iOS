//
//  ContentView.swift
//  SwiftUI-SwiftBook
//
//  Created by Азат Зиганшин on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentLight = -1

    var body: some View {
        ZStack(content: {
            Color(.systemBlue)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                ColorCircleView(color: currentLight == 0 ? .red : Color.gray)
                ColorCircleView(color: currentLight == 1 ? .yellow : Color.gray)
                ColorCircleView(color: currentLight == 2 ? .green : Color.gray)

                Spacer()

                Button(action: {
                    currentLight = (currentLight + 1) % 3
                }, label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.title)
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(.white), lineWidth: 4))
            }
            .padding()
        })
    }
}

#Preview {
    ContentView()
}

