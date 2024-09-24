//
//  DataManager.swift
//  HW107
//
//  Created by Азат Зиганшин on 03.11.2023.
//

import Foundation

struct Publication {
    let description: String
}

class DataManager {

    let publications: [Publication] = [Publication(description: "abc"), Publication(description: "123")]

//    func asyncGetAllPublications(completion: @escaping (([Publication]?) -> Void)) {
//
//        let queue = OperationQueue()
//
//        let operation = BlockOperation { [weak self] in
//            completion(self?.publications)
//        }
//
//        queue.addOperation(operation)
//    }

        func asyncGetAllPublications() async -> [Publication]? {

            return await withCheckedContinuation { continuation in
                let queue = OperationQueue()

                let operation = BlockOperation { [weak self] in
                    continuation.resume(returning: self?.publications)
                }

                queue.addOperation(operation)
            }
        }
}
