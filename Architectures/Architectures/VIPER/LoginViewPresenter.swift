//
//  LoginViewPresenter.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

class LoginViewPresenter {
    
    weak var view: LoginViewControllerVP?
    var interactor: LoginViewInteractor!
    var router: LoginViewRouter!

    func didPressLogin(with email: String?, password: String?) {

        interactor.login(with: email, password: password)
    }

    func userLoginResult(result: Result<User, Error>) {
        
        view?.updateUI(result: result)
        router.showMainViewController()
    }
}
