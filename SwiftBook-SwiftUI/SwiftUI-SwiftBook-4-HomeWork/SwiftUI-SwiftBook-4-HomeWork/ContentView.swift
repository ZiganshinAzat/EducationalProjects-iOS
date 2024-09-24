//
//  ContentView.swift
//  SwiftUI-SwiftBook-4-HomeWork
//
//  Created by Азат Зиганшин on 22.08.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var randomNumber = Int.random(in: 0...100)
    @State private var sliderValue = 0
    @State private var resultAlertPresenter = false

    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(randomNumber)")
            
            HStack(spacing: 16) {
                Text("0")
                UISliderRepresentation(
                    value: $sliderValue,
                    color: .systemRed,
                    alpha: CGFloat(computeScore()) / 100
                )
                Text("100")
            }
            .padding([.top, .bottom])
            
            VStack(spacing: 16) {
                Button("Проверь меня!", action: checkMe)
                .alert("Your score", isPresented: $resultAlertPresenter, actions: { }) {
                    Text("\(computeScore())")
                }

                Button("Начать заново", action: updateRandomNumber)
            }
        }
        .padding()
    }

    private func updateRandomNumber() {
        randomNumber = Int.random(in: 0...100)
    }

    private func checkMe() {
        resultAlertPresenter = true
    }

    private func computeScore() -> Int {
        let difference = abs(randomNumber - sliderValue)
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
