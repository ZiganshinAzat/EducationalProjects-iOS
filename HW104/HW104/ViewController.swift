//
//  ViewController.swift
//  HW104
//
//  Created by Азат Зиганшин on 02.10.2023.
//

import UIKit

class ViewController: UIViewController {

    enum TableSection {
        case main
        case secondary
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        //table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        table.isEditing = false
        return table
    }()
    
    
    var tableContent: [String] = []
    var dataSource: UITableViewDiffableDataSource<TableSection, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableContent = ["Mercedes", "BMW", "Audi"]
        setupLayout()
        setupNavigationBar()
        setupDataSource()
    }
    
    func setupDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
            var listConfiguration = cell.defaultContentConfiguration()
            listConfiguration.text = itemIdentifier
            listConfiguration.secondaryText = "123"
            cell.contentConfiguration = listConfiguration
            
            return cell
        })
        updateDataSource(with: tableContent)
    }
    
    func updateDataSource(with content: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(content)
        dataSource?.apply(snapshot)
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Main"
        let editAction = UIAction { _ in
            self.tableView.isEditing.toggle()
        }
        let addAction = UIAction { _ in
            //self.tableContent.append("Subaru")
            //self.updateDataSource(with: self.tableContent)
            
            guard var snapshot = self.dataSource?.snapshot() else { return }
            snapshot.appendItems(["Subaru"], toSection: .main)
            self.dataSource?.apply(snapshot)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .edit, primaryAction: editAction, menu: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addAction, menu: nil)
    }

}

extension ViewController: UITableViewDelegate {
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        
        let text = dataSource[indexPath.row]
        var listConfiguration = cell.defaultContentConfiguration()
        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
        backgroundConfiguration.backgroundColor = .white
        listConfiguration.text = text
        listConfiguration.secondaryText = "123"
        cell.contentConfiguration = listConfiguration
        cell.backgroundConfiguration = backgroundConfiguration
        return cell
    }*/
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let text = dataSource?.itemIdentifier(for: indexPath){
            navigationController?.pushViewController(DetailViewController(with: text), animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
