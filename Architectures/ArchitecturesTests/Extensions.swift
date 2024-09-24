//
//  Extensions.swift
//  ArchitecturesTests
//
//  Created by Азат Зиганшин on 08.04.2024.
//

import Foundation

@testable import struct Architectures.User
@testable import protocol Architectures.NetworkService

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
}

class NetworkServiceMock: NetworkService {

    let user = User(name: "Azz", age: 20, email: "azzz", password: "azzzz")

    func obtainUser() async throws -> User {
        return user
    }
}
