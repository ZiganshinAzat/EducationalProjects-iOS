//
//  SwiftUI_SwiftBook_3App.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 19.08.2024.
//

import SwiftUI

@main
struct SwiftUISwiftBook3App: App {
    @StateObject var userManager = UserManager(user: UserDefaultsManager.shared.fetchUser())

    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
