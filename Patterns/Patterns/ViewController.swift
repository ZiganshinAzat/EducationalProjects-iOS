//
//  ViewController.swift
//  Patterns
//
//  Created by Азат Зиганшин on 08.03.2024.
//

import UIKit

class ViewController: UIViewController {

    let buttonBuilder: ButtonBuilder = ButtonBuilder()
    let viewModel: ViewModel
    let alertFactory: AlertFactory = AlertFactory()

    init(viewModel: ViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue

        var _: UIButton = buttonBuilder
                                    .addTitle("Press me")
                                    .addBackgroundColor(.red)
                                    .addCornerWidth(5)
                                    .addCornerRadius(5)
                                    .buildButton()

        _ = alertFactory.makeAlert(of: .errorAlert(title: "Ошибка"))
    }


}

