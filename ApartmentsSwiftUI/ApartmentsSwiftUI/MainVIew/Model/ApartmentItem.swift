//
//  ApartmentItem.swift
//  ApartmentsSwiftUI
//
//  Created by Азат Зиганшин on 03.09.2024.
//

import Foundation

struct ApartmentItem: Identifiable {
    let id: String = UUID().uuidString
    let mainImage: String
    let name: String
    let price: String
    let address: String
    let options: [ApartmentItemOption]
    let descriptionImages: [String]

    static func mockData() -> [ApartmentItem] {
        [
            ApartmentItem(
                mainImage: "appartment0",
                name: "Ольховый Квартал",
                price: "8 029 445",
                address: "Москва, поселение Сосенское, деревня Столбово",
                options: [
                    ApartmentItemOption(
                        optionName: "Студии",
                        optionValue: "от 8 млн ₽"
                    ),
                    ApartmentItemOption(
                        optionName: "1-комн.",
                        optionValue: "от 10,1 млн ₽"
                    ),
                    ApartmentItemOption(
                        optionName: "2-комн.",
                        optionValue: "от 11,4 млн ₽"
                    )
                ],
                descriptionImages: [
                    "appartment01",
                    "appartment02",
                    "appartment03",
                    "appartment04"
                ]
            ),
            ApartmentItem(
                mainImage: "appartment1",
                name: "Новое Видное",
                price: "4 735 485",
                address: "Городское поселение Горки Ленинские, Ленинский городской округ, Московская область",
                options: [
                    ApartmentItemOption(
                        optionName: "Студии",
                        optionValue: "от 4,6 млн ₽"
                    ),
                    ApartmentItemOption(
                        optionName: "1-комн.",
                        optionValue: "от 6,1 млн ₽"
                    ),
                    ApartmentItemOption(
                        optionName: "2-комн.",
                        optionValue: "от 11,4 млн ₽"
                    )
                ],
                descriptionImages: [
                    "appartment11",
                    "appartment12",
                    "appartment13",
                    "appartment14"
                ]
            )
        ]
    }

}

