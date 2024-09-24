//
//  ApartmentImageView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import SwiftUI

struct ApartmentImageView: View {
    let image: String

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

