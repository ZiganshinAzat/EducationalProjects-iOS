//
//  FirebaseManager.swift
//  FirebaseExample
//
//  Created by Азат Зиганшин on 04.04.2024.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class FirebaseManager {

    private func configureDB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }

    func getDocument(collection: String, document: String, completion: @escaping (Result<DocumentSnapshot, Error>) -> Void) {
        let db = configureDB()
        let docRef = db.collection(collection).document(document)
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
            } else if let document = document {
                completion(.success(document))
            }
        }
    }

    // Метод для добавления документа в коллекцию
    func addDocument(collection: String, data: [String: Any], completion: @escaping (Error?) -> Void) {
        let db = configureDB()
        db.collection(collection).addDocument(data: data) { error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
}
