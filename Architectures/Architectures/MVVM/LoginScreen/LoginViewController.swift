//
//  ViewController.swift
//  Architectures
//
//  Created by Азат Зиганшин on 01.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView: LoginView = .init()
    private var loginViewModel: LoginViewModel

    init(loginViewModel: LoginViewModel) {

        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {

        view = loginView
        loginView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        view.backgroundColor = .systemOrange
    }

}

extension LoginViewController: LoginViewDelegate {

    func didPressLogin(with email: String?, password: String?) {
        loginViewModel.login(with: email, password: password)
    }

    func setupBindings() {

        loginViewModel.userValidationResultBlock = { [weak self] result in

            switch result {
            case .success:
                self?.view.backgroundColor = .white
            case .failure:
                print("Error")
            }
        }
    }
}

