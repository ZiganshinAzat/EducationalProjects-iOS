//
//  ContentViewModel.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var apartments: [ApartmentItem] = []

    func getApartments() {
        apartments = ApartmentItem.mockData()
    }
}
