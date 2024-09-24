//
//  NetworkManager.swift
//  Architectures
//
//  Created by Азат Зиганшин on 08.04.2024.
//

import Foundation

protocol NetworkService {
    func obtainUser() async throws -> User
}

class UserNetworkManager: NetworkService {
    let session = URLSession.shared

    func obtainUser() async throws -> User {
        let request = URLRequest(url: URL(string: "google.com")!)
        let responceData = try await session.data(for: request)

        return try JSONDecoder().decode(User.self, from: responceData.0)
    }

}
