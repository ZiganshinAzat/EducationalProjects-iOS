//
//  ContentView.swift
//  SwiftUI-SwiftBook-6
//
//  Created by Азат Зиганшин on 24.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "medal")
                    Text("Home")
                }
            CartRacingView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart Racing")
                }
            AwardsView()
                .tabItem {
                    Image(systemName: "trophy")
                    Text("Awards")
                }
        }
    }
}

#Preview {
    ContentView()
}
