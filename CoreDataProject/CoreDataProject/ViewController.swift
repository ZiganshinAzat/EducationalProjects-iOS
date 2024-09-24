//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Азат Зиганшин on 03.01.2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var dataManager = CoreDataManager.shared

    lazy var showInfoButton: UIButton = {

        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Info", for: .normal)

        let action = UIAction { _ in

            let data = self.dataManager.obtainSavedData()
            for user in data {
                print(String(user.pets.first?.age ?? 0) + " " + String(user.age))
            }
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    lazy var addButton: UIButton = {
        
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Info", for: .normal)

        let action = UIAction { _ in
            let user = User(context: self.dataManager.viewContext)
            user.name = "Tom"
            user.age = Int16(Int.random(in: 10...100))

            let pet = Pet(context: self.dataManager.viewContext)
            pet.nick = "Jerry"
            pet.age = Int16(Int.random(in: 1000...10000))

            user.addToPets(pet)

            self.dataManager.saveContext()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = .blue
        setupLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let data = dataManager.obtainSavedData()
//        for user in data {
//            print((user.name ?? "") + " " + String(user.age))
//        }
    }

}

extension ViewController {

    func setupLayout() {

        view.addSubview(showInfoButton)
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            showInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showInfoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: showInfoButton.bottomAnchor, constant: 10)
        ])
    }
}

