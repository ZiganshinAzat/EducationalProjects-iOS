//
//  ContentView.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct ContentView: View {
    let persons = DataManager.shared.getPersons()
    
    var body: some View {
        TabView {
            ContactsView(persons: persons)
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Contacts")
                }
            NumbersView(persons: persons)
                .tabItem {
                    Image(systemName: "phone")
                    Text("Numbers")
                }
        }
    }
}

#Preview {
    ContentView()
}
