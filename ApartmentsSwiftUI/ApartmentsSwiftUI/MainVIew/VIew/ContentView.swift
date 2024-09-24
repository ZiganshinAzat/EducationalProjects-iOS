//
//  ContentView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 01.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("\(viewModel.apartments.count) предложений")
                        .font(.title2)
                        .fontWeight(.medium)

                    VStack(spacing: 10) {
                        ForEach(viewModel.apartments) { item in
                            NavigationLink {
                                DetailView(item: item)
                                    .toolbar(.hidden, for: .navigationBar)
                            } label: {
                                ApartmentItemView(item: item)
                                    .tint(.black)
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            .background(.appLigth)
            .scrollIndicators(.hidden)
        }
        .onAppear {
            viewModel.getApartments()
        }
    }
}


#Preview {
    ContentView()
}


