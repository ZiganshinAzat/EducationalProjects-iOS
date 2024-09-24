//
//  UITableViewCellExtension.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

