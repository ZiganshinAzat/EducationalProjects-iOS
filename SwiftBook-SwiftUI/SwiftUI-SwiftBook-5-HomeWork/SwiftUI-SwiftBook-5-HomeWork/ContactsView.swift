//
//  ContactsView.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct ContactsView: View {
    let persons: [Person]

    var body: some View {
        NavigationStack {
            List(persons) { person in
                NavigationLink(destination: ContactDetailView(person: person)) {
                    Text("\(person.fullName)")
                }
            }
            .navigationTitle("Contact List")
        }
    }
}

#Preview {
    ContactsView(persons: DataManager.shared.getPersons())
}
