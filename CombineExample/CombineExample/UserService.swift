//
//  UserService.swift
//  CombineExample
//
//  Created by Азат Зиганшин on 07.04.2024.
//

import Foundation
import Combine

class UserService {

    func obtainData() -> AnyPublisher<[User], Error> {

        let url = URL(string: "google.com")
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
