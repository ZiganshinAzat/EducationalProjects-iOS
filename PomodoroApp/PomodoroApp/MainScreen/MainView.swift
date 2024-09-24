//
//  MainView.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import UIKit

class MainView: UIView {

    lazy var timerLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "00:00"

        return label
    }()

    lazy var intervalLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .center
        label.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleIntervalLabelTap))
        label.addGestureRecognizer(tapGesture)

        return label
    }()

    lazy var affairsTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AffairsTableViewCell.self, forCellReuseIdentifier: AffairsTableViewCell.reuseIdentifier)
        tableView.backgroundColor = UIColor(red: 0x08/255, green: 0x0A/255, blue: 0x17/255, alpha: 1.0)
        tableView.allowsSelection = true

        return tableView
    }()

    lazy var addAffairButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "addButtonIcon"), for: .normal)

        let action = UIAction { [weak self] _ in
            guard let addButtonTapped = self?.addButtonTapped else { return }
            addButtonTapped()
        }

        button.addAction(action, for: .touchUpInside)

        return button
    }()

    lazy var startButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "startButtonIcon"), for: .normal)

        let action = UIAction { [weak self] _ in
            guard let startButtonTapped = self?.startButtonTapped else { return }
            startButtonTapped()
        }

        button.addAction(action, for: .touchUpInside)

        return button
    }()

    var addButtonTapped: (() -> Void)?
    var startButtonTapped: (() -> Void)?
    var intervalLabelTapped: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {

    @objc func handleIntervalLabelTap() {
        if let intervalLabelTapped {
            intervalLabelTapped()
        }
        else {
            print("No action for label")
        }
    }

    func setupLayout() {
        addSubview(intervalLabel)
        addSubview(affairsTableView)
        addSubview(addAffairButton)
        addSubview(startButton)
        addSubview(timerLabel)

        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),

            intervalLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20),
            intervalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            intervalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            affairsTableView.topAnchor.constraint(equalTo: intervalLabel.bottomAnchor, constant: 10),
            affairsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            affairsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            affairsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),

            addAffairButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addAffairButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            addAffairButton.heightAnchor.constraint(equalToConstant: 60),
            addAffairButton.widthAnchor.constraint(equalTo: addAffairButton.heightAnchor),

            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor)
        ])
    }
}
