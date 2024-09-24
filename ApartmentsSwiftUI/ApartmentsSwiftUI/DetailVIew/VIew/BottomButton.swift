//
//  BottomButton.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import SwiftUI

struct BottomButton: View {
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color

    var body: some View {
        Button(action: {

        }, label: {
            Text(text)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(.rect(cornerRadius: 10))
        })
    }
}

