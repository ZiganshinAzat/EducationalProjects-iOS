//
//  LoginViewSnapshotTests.swift
//  ArchitecturesTests
//
//  Created by Азат Зиганшин on 08.04.2024.
//

import XCTest
import SnapshotTesting
@testable import Architectures

final class LoginViewSnapshotTests: XCTestCase {

    func testExample() throws {
        let loginViewModel = LoginViewModel(users: [User(name: "Olol", age: 30, email: "ololo", password: "olalo")], userService: NetworkServiceMock())
        let loginViewController = LoginViewController(loginViewModel: loginViewModel)

        assertSnapshot(of: loginViewController, as: .image)
    }
}
