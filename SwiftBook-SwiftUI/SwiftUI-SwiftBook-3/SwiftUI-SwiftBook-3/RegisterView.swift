//
//  RegisterView.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 19.08.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        ZStack {
            TextField("Enter your name", text: $userManager.user.name)
                .multilineTextAlignment(.center)

            HStack{
                Spacer()
                Text("\(userManager.user.name.count)")
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
            }
            .padding()
        }

        Button(action: registerUser, label: {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("OK")
            }
        })
        .disabled(!userManager.nameIsValid)
    }

    private func registerUser() {
        userManager.user.isRegistered = true
        UserDefaultsManager.shared.saveUser(user: userManager.user)
        
    }
}

#Preview {
    RegisterView()
        .environmentObject(UserManager())
}
