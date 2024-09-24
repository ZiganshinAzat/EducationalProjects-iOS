//
//  DetailView.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 01.09.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss

    let item: ApartmentItem

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        Image(item.mainImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width)
                            .frame(height: 400 + (minY > 0 ? minY : 0))
//                            .clipped()
                            .offset(y: -minY)
                    }
                    .frame(height: 400)

                    VStack(alignment: .leading, spacing: 32) {
                        VStack(alignment: .leading,spacing: 20) {
                            VStack(alignment: .leading, spacing: 17) {
                                Text(item.name)
                                    .font(.system(size: 22, weight: .black))
                                Text("от \(item.price) р")
                                    .font(.system(size: 22, weight: .black))
                                Text(item.address)
                                    .font(.system(size: 13))
                                    .foregroundStyle(.gray)
                            }
                            HStack {
                                ForEach(item.options) { option in
                                    ApartmentItemOptionView(option: option)
                                }
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("Отделка квартир")
                                .font(.system(size: 24, weight: .black))

                            LazyVGrid(columns: columns, spacing: 4) {
                                ForEach(item.descriptionImages, id: \.self) { image in
                                    ApartmentImageView(image: image)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 35)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.top, -15)
                }
            }
            .scrollIndicators(.hidden)

            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                        Text("Назад")
                    })
                    Spacer()
                    BookmarkView()
                }
                .tint(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal, 20)
                .padding(.top, 45)

                Spacer()

                HStack(spacing: 12) {
                    BottomButton(text: "Заказать звонок", backgroundColor: .appLigthBlue, foregroundColor: .appBlue)
                    BottomButton(text: "Позвонить", backgroundColor: .appBlue, foregroundColor: .white)
                }
                .padding(.bottom, 40)
            .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailView(item: ApartmentItem.mockData().first!)
}
