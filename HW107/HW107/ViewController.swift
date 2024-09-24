//
//  ViewController.swift
//  HW107
//
//  Created by Азат Зиганшин on 03.11.2023.
//

import UIKit

class ViewController: UIViewController {

    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

//        dataManager.asyncGetAllPublications { publications in
//            print(publications ?? 0)
//        }

        Task {
            print(await dataManager.asyncGetAllPublications())
            async let posts = dataManager.asyncGetAllPublications()
            print(await posts)
        }

    }

}

