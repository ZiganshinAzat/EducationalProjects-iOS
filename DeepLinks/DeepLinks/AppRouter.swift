//
//  AppRouter.swift
//  DeepLinks
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation
import UIKit

enum Screen {
    case main(text: String?)
    case detail(text: String?)
}

class AppRouter {

    weak var currentNavigationController: UINavigationController?

    func routeTo(_ screen: Screen) {
        switch screen {
        case .main(_):
            break
        case .detail(let text):
            let detailViewController = DetailViewController()
            detailViewController.configure(with: text)
            currentNavigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
