//
//  LoginViewControllerVP.swift
//  Architectures
//
//  Created by Азат Зиганшин on 02.03.2024.
//

import UIKit

class LoginViewControllerVP: UIViewController, LoginViewPresenterOutput {

    private let loginView: LoginViewVP = .init()

    var presenter: LoginViewPresenterInput!

    override func loadView() {

        view = loginView
        loginView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
    }

    func updateUI(result: Result<User, Error>) {

        switch result {
        case .success(_):
            loginView.backgroundColor = .black
        case .failure(let error):
            print(error)
        }
    }

}

extension LoginViewControllerVP: LoginViewVPDelegate {

    func didPressLogin(with email: String?, password: String?) {
        presenter.didPressLogin(with: email, password: password)
    }
}


