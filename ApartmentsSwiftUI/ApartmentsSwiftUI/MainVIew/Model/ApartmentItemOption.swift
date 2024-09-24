//
//  ApartmentItemOption.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import Foundation

struct ApartmentItemOption: Identifiable {
    let id: String = UUID().uuidString
    let optionName: String
    let optionValue: String
}
