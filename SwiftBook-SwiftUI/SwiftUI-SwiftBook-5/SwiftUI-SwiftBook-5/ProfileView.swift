//
//  ProfileView.swift
//  SwiftUI-SwiftBook-5
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .opacity(0.4)

    }
}

#Preview {
    ProfileView()
}
