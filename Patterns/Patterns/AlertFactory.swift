//
//  AlertFactory.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import Foundation
import UIKit

enum AlertType {
    case okAlert(title: String)
    case cancelAlert(title: String)
    case errorAlert(title: String)
}

class AlertFactory {

    func makeAlert(of type: AlertType) -> UIAlertController {
        switch type {
        case .okAlert(let title):
            makeOkAlert(with: title)
        case .cancelAlert(title: let title):
            makeCancelAlert(with: title)
        case .errorAlert(title: let title):
            makeErrorAlert(with: title)
        }
    }

    private func makeOkAlert(with title: String) -> UIAlertController {

        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)

        return alert
    }

    private func makeCancelAlert(with title: String) -> UIAlertController {

        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(okAction)

        return alert
    }

    private func makeErrorAlert(with title: String) -> UIAlertController {

        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Error", style: .default)
        alert.addAction(okAction)

        return alert
    }
}
