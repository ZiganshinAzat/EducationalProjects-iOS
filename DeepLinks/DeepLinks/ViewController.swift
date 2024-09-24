//
//  ViewController.swift
//  DeepLinks
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default"

        return label
    }()

    lazy var pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Push me", for: .normal)

        let action = UIAction { [weak self] _ in
            self?.show(DetailViewController(), sender: nil)
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    func setupLayout() {
        view.backgroundColor = .white

        view.addSubview(textLabel)
        view.addSubview(pushButton)

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func configure(with text: String?) {
        textLabel.text = text
    }
}

