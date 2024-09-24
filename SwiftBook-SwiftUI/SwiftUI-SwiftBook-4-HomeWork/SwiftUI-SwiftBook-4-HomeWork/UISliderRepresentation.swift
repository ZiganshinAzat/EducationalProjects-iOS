//
//  UISliderRepresentation.swift
//  SwiftUI-SwiftBook-4-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import Foundation
import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {

    @Binding var value: Int

    let color: UIColor
    let alpha: CGFloat

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)

        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(alpha)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

// MARK: Coordinator
extension UISliderRepresentation {

    final class Coordinator {
        @Binding var value: Int

        init(value: Binding<Int>) {
            self._value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            let sliderValue = sender.value
            value = Int(round(sliderValue))
        }
    }
}
