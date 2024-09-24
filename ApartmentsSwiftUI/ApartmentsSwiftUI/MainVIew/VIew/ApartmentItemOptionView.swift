//
//  ApartmentItemOptionView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 01.09.2024.
//

import SwiftUI

struct ApartmentItemOptionView: View {
    let option: ApartmentItemOption

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(option.optionName)
                .foregroundStyle(.gray)
            Text(option.optionValue)
        }
        .font(.system(size: 12))
        .padding(.vertical, 10)
        .padding(.horizontal, 13)
        .background(.appLigth2)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

