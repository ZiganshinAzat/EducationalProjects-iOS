//
//  ViewModel.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import Foundation

class ViewModel {

    let loginService: DefaultLoginService
    let cachedDataService: CachedDataService
    let dataCacheHandler: DataCacheHandler

    init(loginService: DefaultLoginService = ServiceLocator.shared.getService()!
         ,cachedDataService: CachedDataService = ServiceLocator.shared.getService()!) {
        self.loginService = loginService
        self.cachedDataService = cachedDataService

        let userDefaultsCacheHandler = UserDefaultsCacheHandler()
        let sqlCacheHandler = SQLCacheHandler()

        self.dataCacheHandler = userDefaultsCacheHandler

        userDefaultsCacheHandler.nextHandler = sqlCacheHandler
    }
    
    func saveData(_ data: Data, type: DataType) {

        dataCacheHandler.handle(data: data, type: type)
    }
}
