//
//  UserSettings.swift
//  SwiftUIExample
//
//  Created by Азат Зиганшин on 30.06.2024.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var isDarkModeEnabled: Bool
    @Published var localeIdentifier: String

    init(isDarkModeEnabled: Bool, localeIdentifier: String) {
        self.isDarkModeEnabled = isDarkModeEnabled
        self.localeIdentifier = localeIdentifier
    }
}
