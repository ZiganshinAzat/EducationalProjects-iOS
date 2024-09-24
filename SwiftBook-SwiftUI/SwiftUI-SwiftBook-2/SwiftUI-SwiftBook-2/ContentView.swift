//
//  ContentView.swift
//  SwiftUI-SwiftBook-2
//
//  Created by Азат Зиганшин on 17.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 0
    @State private var userName = ""
    @State private var dispayedName = ""
    @State private var validationAlertPresented = false

    let globeSize = CGSize(width: 200, height: 200)

    var body: some View {
        VStack(spacing: 20) {
            Text("\(lround(sliderValue))")
                .font(.title2)
            ColorSliderView(value: $sliderValue, textColor: .red)

            UserNameView(userName: dispayedName)
            TextField("Введите имя", text: $userName)
                .applyAppTextFieldStyle()

            Button("Done", action: validate)
                .alert("Неккоректные данные", isPresented: $validationAlertPresented, actions: { }) {
                    Text("Введите корректные данные")
                }

            Text("Welcome to")
                .applyAppTextStyle()
            Text("SwiftUI")
                .applyAppTextStyle()

            Image(systemName: "globe")
                .resizable()
                .frame(size: globeSize)

            Spacer()
        }
        .padding()
    }

    private func validate() {
        if let _ = Double(userName) {
            validationAlertPresented.toggle()
            userName = ""
            return
        }
        dispayedName = userName
        userName = ""
    }
}

#Preview {
    ContentView()
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color

    var body: some View {
        HStack {
            Text("0").foregroundStyle(textColor)
            Slider(value: $value, in: 0...255, step: 1)
            Text("255").foregroundStyle(textColor)
        }
    }
}

struct UserNameView: View {
    let userName: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Username:")
                .frame(height: 40)
            Text(userName)
                .font(.title)
            Spacer()
        }
    }
}

struct AppTextStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60))
            .foregroundStyle(.pink)
            .bold()
    }
}

struct FrameFromSizeModifier: ViewModifier {
    let size: CGSize

    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

struct AppTextFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 0.4)
            )
            .shadow(color: .gray, radius: 3, x: 1, y: 3)
    }
}


