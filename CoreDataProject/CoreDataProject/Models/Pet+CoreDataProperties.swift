//
//  Pet+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Азат Зиганшин on 05.01.2024.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var age: Int16
    @NSManaged public var nick: String?
    @NSManaged public var user: User?

}

extension Pet : Identifiable {

}
