//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Азат Зиганшин on 04.04.2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    lazy var lite: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.kf.setImage(with: URL(string: "https://lh3.googleusercontent.com/pw/AP1GczOnvQNIY-XY07Cn4Se40_Udgxel-8bex-F5dp7rQlzsxKFPIeBCRx7sH0kd2qTv9N75dxUq2Td0bcOJXQM-h12dxm8PNPgPsW34ozDWvUQkWKXcR20PamYXsq7Ahn4P7X8dDXBAzWNb8xI9LG6Nv0YkCIcWrhhM5TYiHu8kJ2Vnx5yoWaRQVdKCPjehwIDKLw5IZppNWqszQRK-8YY7pcG-nEGLKoMgRci1xU02sHOvBIfqcF6WjoWOLcMxKsN410ncSh4cH9JjdqSKOra5RBLCriOZXet8MFUoK3IU29QVC5A0-x-hatJkBRrrHR7KwqHbCRd4fu9RbvbWZRRjDfjN1_Xr21ueC7ibewS_hst6xIsFj01ASz_TzYg-oOBnhsCg3CIWDCIaK-e1gIQ-CCsk7B8HkUj9PSsQFNB36EuPZq9OuXtSeUrbod2R_yax6MsWzXTQtW0kkhEi6PCHZBls785sEIsYZPuFj1F7de4v9l-VtA1N9F2gq-6MILfwb55iaUgxtENSYYpbMve0GSb1d7o3nMNaL9vL9es7ZEMBKpGqLPFH2351krZjOeld_ZXszOihYrNetLGLNBQIkeTk0LtWi3bRZB8nSSLg7N50T18JiZ8TvsIH8yXMB94K4aCDddn1QB6dGLw-6kq7QAtX_AOrDipyUAqU9jgKy_foKj1b-KJngLnyKB4lI5HhV4xa71pAJVwe2clUQlCUZPYrcByDuKMTK_RSNrxYBIKs7H-9WGPpqpbbmU21bZwt-sNweUb4-rYrJHHx97RTFVwZuedyBPho6DP6lmre6SpdmmcC1Hw59DhT3Zz1d2r6khusk_OVn3WWJVMhAVZPjf6My-m8z6y-pjEp_4XOCtkDL-tu_vOOmiKF0WOic8ElVurcsqGgQVkt-5ZlZTJwz94A=w512-h512-s-no-gm?authuser=0"))

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        view.addSubview(lite)

        NSLayoutConstraint.activate([
            lite.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lite.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lite.heightAnchor.constraint(equalToConstant: 200),
            lite.widthAnchor.constraint(equalToConstant: 200)
        ])


        let firebaseManager = FirebaseManager()
//        firebaseManager.addDocument(collection: "users", data: ["id" : "Azat"]) { error in
//            if let error = error {
//                print("Произошла ошибка \(error)")
//            } else {
//                print("Документ добавлен")
//            }
//        }
//        firebaseManager.getDocument(collection: "users", document: "NvMWO6brT7WqJQ6OdyqN") { result in
//            switch result {
//            case .success(let document):
//                let documentData = document.data()
//                debugPrint(documentData)
//            case .failure(let error):
//                print("Error \(error)")
//            }
//        }
    }


}

