//
//  ViewController.swift
//  HW109
//
//  Created by Азат Зиганшин on 26.11.2023.
//

import UIKit

class User : Codable {

    // Codable = encodable + decodable

    let name: String
    let age: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let users: [User] = []

        let userDefaults = UserDefaults.standard

        userDefaults.setValue(true, forKey: "logged_in")
        // userDefaults.value(forKey: "logged_in")
        userDefaults.bool(forKey: "logged_in")

        // Область видимости
        // Черед UserDefaults.standart нельзя обратиться к его значениям
        let settingsDefaults = UserDefaults(suiteName: "user_settings")
        // settingsDefaults?.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)

        // Сериализация
        do {
            let encoder = JSONEncoder()
            let usersData = try encoder.encode(users)
            userDefaults.setValue(usersData, forKey: "users")
        }
        catch {
            print("Saving error: \(error)")
        }

        // Десериализация
        do {
            guard let usersData = userDefaults.data(forKey: "users")
            else { return }
            let decoder = JSONDecoder()
            let users = try decoder.decode([User].self, from: usersData)
        }
        catch {
            print("Obtaining error: \(error)")
        }

    }


}

