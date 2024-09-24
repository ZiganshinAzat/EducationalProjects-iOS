//
//  NumbersView.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct NumbersView: View {
    let persons: [Person]

    var body: some View {
        VStack {
            VStack {
                HStack(content: {
                    Text("Contact List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                })
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 0))
            }
            List(persons) { person in
                Section {
                    PersonInfoView(image: Image(systemName: "phone"), text: person.number)
                    PersonInfoView(image: Image(systemName: "tray"), text: person.email)
                } header: {
                    Text(person.fullName)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NumbersView(persons: DataManager.shared.getPersons())
}
