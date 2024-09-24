//
//  Person.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import Foundation

struct Person: Identifiable {
    let id = UUID().uuidString
    let name: String
    let surname: String
    let email: String
    let number: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
