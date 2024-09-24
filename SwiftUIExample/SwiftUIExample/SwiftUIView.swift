//
//  SwiftUIView.swift
//  SwiftUIExample
//
//  Created by Азат Зиганшин on 13.05.2024.
//

import SwiftUI

// HStack - горизонтальный стек
// VStack - вертикальный стек
// ZStack - стек, который определяет какие из view будут на переднем плане в зависимости от порядка добавление их в этот стек

class ProgressCounter: ObservableObject {
    @Published var counter: Int = 0
}

struct CounterView: View {
    //@ObservedObject var progressCounter: ProgressCounter
    @Binding var progressCounter: Int

    var body: some View {
        VStack {
            Button("Increase") {
                progressCounter += 1
            }
            Button("Descrease") {
                progressCounter -= 1
            }
        }
    }
}

struct SwiftUIView: View {
    
//    @StateObject private var progressCounter = ProgressCounter()
    @State private var progressCounter = 0
    @StateObject var userSettings = UserSettings(isDarkModeEnabled: false, 
                                                 localeIdentifier: "en_US")
    @Environment(\.dismiss) var dismiss

    var body: some View {
        // NavigationView старое
        NavigationStack {
            VStack {
                Button("Dismiss") {
                    dismiss()
                }
                .applyAppButtonStyle()
                Text("Hello")
                    .padding(.bottom, 20)
                    .onAppear(perform: {
                        print("Appear")
                    })
                    .onDisappear(perform: {
                        print("Disappear")
                    })
                NavigationLink("Users") {
                    DetailView(users: [
                        User(id: UUID(), name: "Azat", age: 20),
                        User(id: UUID(), name: "Azat", age: 20),
                        User(id: UUID(), name: "Azat", age: 20),
                        User(id: UUID(), name: "Azat", age: 20),
                        User(id: UUID(), name: "Azat", age: 20)
                    ])
                }
                .buttonStyle(PlainButtonStyle())
                .padding(20)

                Text("\(progressCounter)")
                CounterView(progressCounter: $progressCounter)
                Spacer()
            }
        }
        .environmentObject(userSettings)
    }
}

#Preview {
    SwiftUIView()
}

struct UserDetailView: View {
    let user: User
    @EnvironmentObject var userSettings: UserSettings

    @State private var locales: [String] = ["en_US", "ru", "tat", "en"]

    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")

            VStack {
                Toggle("Dark mode enabled", isOn: $userSettings.isDarkModeEnabled)
                Picker("Selected locale", selection: $userSettings.localeIdentifier) {
                    ForEach(locales, id: \.self) { locale in
                        Text(locale)
                    }
                }
            }
            .padding()
        }
    }
}

struct DetailView: View {
    let users: [User]

    var body: some View {
        Text("Detail")

//        ForEach(users) { user in
//            Text(user.name)
//                .padding()
//        }
        List(users) { user in
            NavigationLink(destination: UserDetailView(user: user)) {
                DetainViewCell(user: user)
            }
        }
    }
}

struct DetainViewCell: View {
    let user: User

    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")
        }
    }
}

struct User: Identifiable {
    var id: UUID
    let name: String
    let age: Int
}

struct AppButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .padding(5)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 0.5)
            }
            .foregroundColor(.green)
    }
}

extension Button {
    func applyAppButtonStyle() -> some View {
        modifier(AppButtonStyle())
    }
}
