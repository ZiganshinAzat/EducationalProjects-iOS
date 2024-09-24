//
//  ViewController.swift
//  HW103
//
//  Created by Азат Зиганшин on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Identifier")
        return table
    }()
    
    var dataSource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        dataSource = ["0", "1", "2", "3"]
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath)
        
        
        let model = dataSource[indexPath.row]
        var listConfiguration = cell.defaultContentConfiguration()
        listConfiguration.text = model
        listConfiguration.secondaryText = "123"
        
        cell.contentConfiguration = listConfiguration
        return cell
    }
    
    
}

