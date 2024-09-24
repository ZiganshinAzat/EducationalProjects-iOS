//
//  ContentView.swift
//  SwiftUI-SwiftBook-2-HomeWork
//
//  Created by Азат Зиганшин on 18.08.2024.
//

import SwiftUI

enum ColorField: Hashable {
    case red, green, blue
}

struct ContentView: View {

    @FocusState private var focusedField: ColorField?

    @State private var redColorValue: Double = Double(Int.random(in: 0...255))
    @State private var greenColorValue: Double = Double.random(in: 0...255).rounded()
    @State private var blueColorValue: Double = Double(Int.random(in: 0...255))

    var body: some View {
        ZStack {
            Color(.systemGray5)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }

            VStack {
                ColorWindowView(
                    color: Color(
                        red: redColorValue / 255,
                        green: greenColorValue / 255,
                        blue: blueColorValue / 255
                    )
                )

                VStack(spacing: 20) {
                    ColorSliderView(value: $redColorValue, sliderColor: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenColorValue, sliderColor: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueColorValue, sliderColor: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .applyToolBar(focusedField: $focusedField)
                .padding()

                Spacer()

            }
            .animation(.bouncy, value: redColorValue)
            .animation(.bouncy, value: greenColorValue)
            .animation(.bouncy, value: blueColorValue)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ColorWindowView: View {
    let color: Color

    var body: some View {
        Color(color)
            .frame(width: 360, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(
                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 6)
            )
    }
}

struct ColorSliderView: View {

    @State private var validationAlertPresented = false
    @State private var text = ""
    @Binding var value: Double
    let sliderColor: Color

    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundStyle(sliderColor)

            Slider(value: $value, in: 0...255, step: 1)
                .tint(sliderColor)
                .onChange(of: value) { oldValue, newValue in
                    text = newValue.formatted()
                }
            //            TextField("", text: Binding(get: {
            //                String(lround(value))
            //            }, set: { newValue in
            //                if let doubleValue = Double(newValue),
            //                   (0...255).contains(doubleValue) {
            //                    value = doubleValue
            //                } else {
            //                    if !newValue.isEmpty {
            //                        validationAlertPresented = true
            //                    }
            //                    value = 0
            //                }
            //            }))
            TextField("", text: $text)
                .onChange(of: text) {
                    textFieldValidation()
                }
                .keyboardType(.numberPad)
                .frame(width: 36, height: 36)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.black), lineWidth: 0.8)
                )
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .alert("Неккоректные данные", isPresented: $validationAlertPresented, actions: { }) {
                    Text("Введите значение от 0 до 255")
                }
        }
        .onAppear(perform: {
            text = value.formatted()
        })
    }

    private func textFieldValidation() {
        if let doubleValue = Double(text),
           (0...255).contains(doubleValue) {
            value = doubleValue
        } else {
            if !text.isEmpty {
                validationAlertPresented = true
            }
            value = 0
        }
    }
}

struct ToolBarModifier: ViewModifier {
    @FocusState.Binding var focusedField: ColorField?

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {

                    Button(action: previousTextField) {
                        Image(systemName: "chevron.up")
                    }

                    Button(action: nextTextField) {
                        Image(systemName: "chevron.down")
                    }

                    Spacer()

                    Button("Done") {
                        //                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        focusedField = nil
                    }
                }
            }
    }

    private func previousTextField() {
        switch focusedField {
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        default:
            break
        }
    }

    private func nextTextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        default:
            break
        }
    }
}

extension View {
    func applyToolBar(
        focusedField: FocusState<ColorField?>.Binding
    ) -> some View {
        modifier(ToolBarModifier(focusedField: focusedField))
    }
}
