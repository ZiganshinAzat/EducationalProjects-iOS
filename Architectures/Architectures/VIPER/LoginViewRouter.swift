//
//  LoginViewRouter.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import Foundation
import UIKit

class LoginViewRouter {
    
    weak var view: LoginViewControllerVP?

    func showMainViewController() {

        view?.show(MainViewController(), sender: nil)
    }
}
