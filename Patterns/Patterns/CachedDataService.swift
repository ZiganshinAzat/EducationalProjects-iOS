//
//  CachedDataService.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import Foundation

protocol DataService {
    func cacheData() -> Data?
}

class CachedDataService: DataService {

    func cacheData() -> Data? {
        return nil
    }
}
