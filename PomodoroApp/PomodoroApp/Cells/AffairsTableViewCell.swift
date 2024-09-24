//
//  AffairsTableViewCell.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import UIKit

class AffairsTableViewCell: UITableViewCell {

    lazy var affairTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "MOCK MOCK MOCK"

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AffairsTableViewCell {

    func setupLayout() {
        contentView.addSubview(affairTitleLabel)

        NSLayoutConstraint.activate([
            affairTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            affairTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            affairTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }

    func configureCell(with affairTitle: String) {
        affairTitleLabel.text = affairTitle
    }
}
