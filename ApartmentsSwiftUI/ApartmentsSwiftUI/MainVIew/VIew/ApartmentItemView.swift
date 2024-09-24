//
//  ApartmentItemView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 01.09.2024.
//

import SwiftUI

struct ApartmentItemView: View {
    let item: ApartmentItem

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                Image(item.mainImage)
                    .resizable()
                    .frame(height: 185)
                    .clipShape(RoundedRectangle(cornerRadius: 15))

                ZStack {
                    BookmarkView()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 13) {
                    Text(item.name)
                        .font(.system(size: 22, weight: .black))
                        .multilineTextAlignment(.leading)
                    Text("от \(item.price) р")
                        .font(.system(size: 22, weight: .black))
                        .multilineTextAlignment(.leading)
                    Text(item.address)
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
                HStack(spacing: 4) {
                    ForEach(item.options) { option in
                        ApartmentItemOptionView(option: option)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
        }
        .padding(.bottom, 26)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


#Preview {
    ApartmentItemView(item: ApartmentItem.mockData().first!)
}

