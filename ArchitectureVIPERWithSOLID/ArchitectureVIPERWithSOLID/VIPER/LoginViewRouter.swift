//
//  LoginViewRouter.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

protocol LoginViewRouterInput: AnyObject {

    func showMainViewController()
}

class LoginViewRouter: LoginViewRouterInput {

    weak var view: UIViewController?

    func showMainViewController() {

        view?.show(MainViewController(), sender: nil)
    }
}
