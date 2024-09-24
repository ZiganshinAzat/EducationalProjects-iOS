//
//  ArchitecturesTests.swift
//  ArchitecturesTests
//
//  Created by Азат Зиганшин on 07.04.2024.
//

import XCTest
@testable import Architectures

final class ArchitecturesTests: XCTestCase {

    let users = [User(name: "Azat", age: 19, email: "azv7_78@mail.ru", password: "123")]
    lazy var loginViewModel = LoginViewModel(users: users, userService: NetworkServiceMock())

    func test_User_Login_Success() {
        // GIVEN
        let testUser = users.first!

        loginViewModel.userValidationResultBlock = { result in
            // THEN
            switch result {
            case .success(let user):
                XCTAssertEqual(user, testUser, "Users not equal!")
            default: break
            }
        }

        // WHEN
        loginViewModel.login(with: testUser.email, password: testUser.password)
    }

    func test_User_Login_Failure() {
        // GIVEN
        let incorrectLogin = "azv7_788@mail.ru"
        let incorrectPassword = "456"

        loginViewModel.userValidationResultBlock = { result in
            // THEN
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as! UserValidationError, UserValidationError.incorrectData)
            default: break
            }
        }

        // WHEN
        loginViewModel.login(with: incorrectLogin, password: incorrectPassword)
    }

    func test_Obtain_User_Success() {
        let userExpectation = expectation(description: "Expecting obtaining user")

        loginViewModel.obtainUser { user in
            userExpectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func test_Obtain_User_2_Success() async {
        let user = await loginViewModel.obtainUser2()

        // И все то же самое как в обычном тесте
    }

    
}
