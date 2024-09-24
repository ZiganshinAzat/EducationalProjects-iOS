//
//  ContentView.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 19.08.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        VStack {
            Text("Hello, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()

            TimerButtonView(timer: timer)

            Spacer()

            LogoutButtonView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct TimerButtonView: View {
    @ObservedObject var timer: TimeCounter

    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 3)
        )
    }
}

struct LogoutButtonView: View {
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        Button(action: {
            UserDefaultsManager.shared.clear(userManager: userManager)
        }) {
            Text("Logout")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 3)
        )
    }
}

