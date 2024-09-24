//
//  UserManager.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 19.08.2024.
//

import Foundation
import Combine
import SwiftUI

final class UserManager: ObservableObject {
    @Published var user = User()

    var nameIsValid: Bool {
        user.name.count >= 3
    }

    init() { }

    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
