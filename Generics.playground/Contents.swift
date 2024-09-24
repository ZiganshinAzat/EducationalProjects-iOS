import UIKit

var greeting = "Hello, playground"

func sum<T: Numeric>(numbers array: [T]) -> T {
    return array.reduce(0, +)
}

print(sum(numbers: [1,2.0,4]))


protocol Savable {
    associatedtype MyData

    var allData: [MyData] { get }

    func save(data: MyData)
}

struct UsersStorage: Savable {
//    Можно не писать, это нужно только для компилятора
//    typealias MyData = String

    var allData: [String]
    
    func save(data: String) {

    }
}

struct AdminsStorage: Savable {

    var allData: [Double]
    
    func save(data: Double) {

    }
}

// some и any связаны с associated type
// some - один определенный associated type
// any - любой associated type

let usersStorage = UsersStorage(allData: ["", "hello"])
let usersStorage1 = UsersStorage(allData: ["world", ""])
let adminsStorage = AdminsStorage(allData: [1.0, 2.0, 3.0])

var anyStorages: [any Savable] = [usersStorage, adminsStorage]

var someStorages: [some Savable] = [usersStorage, usersStorage1]
