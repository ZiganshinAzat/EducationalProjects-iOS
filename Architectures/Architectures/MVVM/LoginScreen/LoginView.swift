//
//  LoginView.swift
//  Architectures
//
//  Created by Азат Зиганшин on 01.03.2024.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didPressLogin(with email: String?, password: String?)
}

enum AccessibilityIdentifiers {
    static let emailTextField = "Email_Text_Field"
}

class LoginView: UIView {

    lazy var emailTextField: UITextField = {

        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.accessibilityIdentifier = AccessibilityIdentifiers.emailTextField

        return textField
    }()

    lazy var passwordTextField: UITextField = {

        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done

        return textField
    }()

    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView: UITextFieldDelegate {

    func setupLayout() {

        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            delegate?.didPressLogin(with: emailTextField.text, password: passwordTextField.text)
        default:
            break
        }

        return true
    }
}
