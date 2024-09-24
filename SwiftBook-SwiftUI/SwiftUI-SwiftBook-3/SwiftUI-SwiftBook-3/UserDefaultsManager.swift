//
//  UserDefaultsManager.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 20.08.2024.
//

import Foundation
import SwiftUI

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    @AppStorage("user") private var userData: Data?

    private init() { }

    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }

    func fetchUser() -> User {
        let user = try? JSONDecoder().decode(User.self, from: userData ?? Data())

        if let user {
            return user
        } else {
            return User()
        }
    }

    func clear(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
        userData = nil
    }
}
