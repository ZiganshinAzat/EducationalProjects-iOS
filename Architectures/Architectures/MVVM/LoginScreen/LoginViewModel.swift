//
//  LoginViewModel.swift
//  Architectures
//
//  Created by Азат Зиганшин on 01.03.2024.
//

import Foundation

enum UserValidationError: Error {
    case incorrectData
}

class LoginViewModel {

    let userService: NetworkService
    private let users: [User]
    private var userValidationResult: Result<User, Error>? {
        didSet {
            guard let result = userValidationResult else { return }
            userValidationResultBlock?(result)
        }
    }

    var userValidationResultBlock: ((Result<User, Error>) -> Void)?

    init(users: [User], userService: NetworkService) {
        self.users = users
        self.userService = userService
    }

    func login(with email: String?, password: String?) {

        for user in users {

            if user.email == email && user.password == password {
                userValidationResult = .success(user)
                return
            }
        }

        userValidationResult = .failure(UserValidationError.incorrectData)
    }

    func obtainUser(completionBlock: @escaping ((User) -> Void)) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            completionBlock(User(name: "Adel", age: 19, email: "azflenfel", password: "678"))
        }
    }

    func obtainUser2() {
        Task {
            let user = try? await userService.obtainUser()
        }
    }
}
