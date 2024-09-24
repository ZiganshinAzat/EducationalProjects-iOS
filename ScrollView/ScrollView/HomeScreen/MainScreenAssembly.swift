//
//  HomeViewModelAssembly.swift
//  ScrollView
//
//  Created by Азат Зиганшин on 02.04.2024.
//

import Foundation
import UIKit

class MainScreenAssembly {

    private init() { }

    static func buildMainScreen() -> UIViewController{

        let viewModel = MainViewModel(filmsAPIManager: KinoPoiskAPIManager())

        let viewController = MainViewController(mainViewModel: viewModel)

        return viewController
    }
}
