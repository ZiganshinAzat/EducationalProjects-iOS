//
//  LoginAssembly.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

class LoginAssembly {

    private init() {

    }

    static func buildLoginScreen() -> UIViewController {

        let view = LoginViewControllerVP()
        let presenter = LoginViewPresenter()
        let interactor = LoginViewInteractor(users: [
            User(name: "Azat", age: 19, email: "azv7_78@mail.ru", password: "123")
        ])
        let router = LoginViewRouter()

        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.view = view

        return view
    }
}
