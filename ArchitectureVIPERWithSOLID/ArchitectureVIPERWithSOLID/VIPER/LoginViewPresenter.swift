//
//  LoginViewPresenter.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

protocol LoginViewPresenterInput: AnyObject {

    func didPressLogin(with email: String?, password: String?)

    func userLoginResult(result: Result<User, Error>)
}

protocol LoginViewPresenterOutput: AnyObject {

    func updateUI(result: Result<User, Error>)
}

class LoginViewPresenter: LoginViewPresenterInput, LoginViewInteractorOutput {

    weak var view: LoginViewPresenterOutput?
    var interactor: LoginViewInteractorInput!
    var router: LoginViewRouterInput!

    func didPressLogin(with email: String?, password: String?) {

        interactor.login(with: email, password: password)
    }

    func userLoginResult(result: Result<User, Error>) {

        view?.updateUI(result: result)
        router.showMainViewController()
    }
}
