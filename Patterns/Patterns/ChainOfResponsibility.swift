//
//  ChainOfResponsibility.swift
//  Patterns
//
//  Created by Азат Зиганшин on 09.03.2024.
//

import Foundation

enum DataType {
    case privateData
    case publicData
}

protocol DataCacheHandler {

    var nextHandler: DataCacheHandler? { get set }
    func handle(data: Data, type: DataType)
}

class BaseDataCacheHandler: DataCacheHandler {

    var nextHandler: DataCacheHandler?

    func handle(data: Data, type: DataType) {

        if let nextHandler {
            nextHandler.handle(data: data, type: type)
        }
    }
}

final class UserDefaultsCacheHandler: BaseDataCacheHandler {

    override func handle(data: Data, type: DataType) {

        if type == .publicData {
            UserDefaults.standard.setValue(data, forKey: "public_token")
        }
        else {
            super.handle(data: data, type: type)
        }
    }
}

final class SQLCacheHandler: BaseDataCacheHandler {

    override func handle(data: Data, type: DataType) {

        if type == .publicData {
            // SQL
        }
        else {
            super.handle(data: data, type: type)
        }
    }
}
