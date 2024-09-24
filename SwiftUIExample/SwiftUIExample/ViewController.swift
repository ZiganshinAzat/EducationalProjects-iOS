//
//  ViewController.swift
//  SwiftUIExample
//
//  Created by Азат Зиганшин on 13.05.2024.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {

    //private let swiftUIView =

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press", for: .normal)
        let action = UIAction() {_ in
            let controller = UIHostingController(rootView: SwiftUIView())
            controller.modalPresentationStyle = .fullScreen
            self.show(controller, sender: nil)
        }
        button.addAction(action, for: .touchUpInside)

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

