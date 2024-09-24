//
//  ContactDetailView.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import SwiftUI

struct ContactDetailView: View {
    let person: Person

    var body: some View {
        ZStack {
            Color(.systemGray5)
                .ignoresSafeArea()

            ContactView(person: person)
        }
    }
}

#Preview {
    ContactDetailView(person: Person(name: "Azat", surname: "Ziganshin", email: "azv7_78@mail.ru", number: "79003257707"))
}

struct ContactView: View {
    let person: Person

    var body: some View {
        ZStack {
            VStack {
                Color(.white)
                    .frame(height: 248)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(20)
                Spacer()
            }

            VStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 48)

                PersonInfoView(
                    image: Image(systemName: "phone"),
                    text: person.number
                )
                .padding(EdgeInsets(top: 26, leading: 40, bottom: 16, trailing: 0))

                PersonInfoView(
                    image: Image(systemName: "tray"),
                    text: person.email
                )
                .padding(.leading, 40)

                Spacer()
            }
        }
        .navigationTitle(person.fullName)

    }
}

struct PersonInfoView: View {
    let image: Image
    let text: String

    var body: some View {
        HStack {
            image
                .foregroundStyle(Color(.systemBlue))
            Text(text)
            Spacer()
        }
    }
}
