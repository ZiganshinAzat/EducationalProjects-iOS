//
//  LoginService.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import Foundation

protocol LoginService {
    func login(with email: String, password: String)
}

class DefaultLoginService: LoginService {

    func login(with email: String, password: String) {
        return
    }
}
