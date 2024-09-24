//
//  DataManager.swift
//  SwiftUI-SwiftBook-5-HomeWork
//
//  Created by Азат Зиганшин on 23.08.2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private let names = ["John", "Jack", "Thomas", "Arthur", "Billy", "Walter", "Jesse", "Larry"]
    private let surnames = ["Shelby", "Henderson", "White", "Pinkman", "Wheels", "Bumstead", "Colins", "Swift"]
    private let numbers = ["+12345678", "+59370573", "+19436740", "+2850361", "+91473094", "+42058375", "+59276503", "+40285727"]
    private let emails = ["zizi@gmail.com", "arthuringho@gmail.com", "peaky@gmail.com", "blinder@gmail.com", "olimpia@gmail.com", "heisenberg@gmail.com", "creatine@gmail.com", "enanthate@gmail.com"]

    private init() { }

    func getPersons() -> [Person] {
        let shuffledNames = names.shuffled()
        let shuffledSurnames = surnames.shuffled()
        let shuffledNumbers = numbers.shuffled()
        let shuffledEmails = emails.shuffled()

        var persons: [Person] = []

        for index in 0..<min(shuffledNames.count, shuffledSurnames.count, shuffledNumbers.count, shuffledEmails.count) {
            let person = Person(
                name: shuffledNames[index],
                surname: shuffledSurnames[index],
                email: shuffledEmails[index],
                number: shuffledNumbers[index]
            )
            persons.append(person)
        }

        return persons
    }

    func getPerson() -> Person {
        let randomName = names.randomElement() ?? ""
        let randomSurname = surnames.randomElement() ?? ""
        let randomNumber = numbers.randomElement() ?? ""
        let randomEmail = emails.randomElement() ?? ""

        return Person(
            name: randomName,
            surname: randomSurname,
            email: randomEmail,
            number: randomNumber
        )
    }
}
