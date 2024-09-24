//
//  ServiceLocator.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation

class ServiceLocator {

    private var services: [String : Any] = [:]

    private init() { }

    static var shared: ServiceLocator = ServiceLocator()

    func addService<T>(_ service: T) {

        let key = String(describing: T.self)
        services[key] = service
    }

    func getService<T>() -> T {

        let key = String(describing: T.self)
        return services[key] as! T
    }
}
