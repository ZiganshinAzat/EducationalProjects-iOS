//
//  StartBuilder.swift
//  ScrollView
//
//  Created by Азат Зиганшин on 25.03.2024.
//

import Foundation
import UIKit

class StarsBuilder {

    private var starsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fillEqually

        return stackView
    }()

    func addStar() -> Self {
        let image = {
            let image = UIImageView(image: UIImage(named: "star"))
            image.translatesAutoresizingMaskIntoConstraints = false

            return image
        }()
        starsStackView.addArrangedSubview(image)

        return self
    }

    func addHalfStar() -> Self {
        let image = {
            let image = UIImageView(image: UIImage(named: "halfStar"))
            image.translatesAutoresizingMaskIntoConstraints = false

            return image
        }()
        starsStackView.addArrangedSubview(image)

        return self
    }

    func buildStars(withStarsSize constant: Int) -> UIStackView {

        for view in starsStackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: CGFloat(constant)),
                view.widthAnchor.constraint(equalTo: view.heightAnchor)
            ])
        }

        return starsStackView
    }
}
