//
//  LoginViewInteractor.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

class LoginViewInteractor {

    weak var presenter: LoginViewPresenter!

    private let users: [User]

    init(users: [User]) {
        self.users = users
    }

    func login(with email: String?, password: String?) {

        for user in users {

            if user.email == email && user.password == password {
                presenter.userLoginResult(result: .success(user))
                return
            }
        }

        presenter.userLoginResult(result: .failure(UserValidationError.incorrectData))
    }
}
