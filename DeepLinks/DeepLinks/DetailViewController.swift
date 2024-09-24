//
//  DetailViewController.swift
//  DeepLinks
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detail"

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    func setupLayout() {
        view.backgroundColor = .white

        view.addSubview(textLabel)

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }

    func configure(with text: String?) {
        textLabel.text = text
    }
}
