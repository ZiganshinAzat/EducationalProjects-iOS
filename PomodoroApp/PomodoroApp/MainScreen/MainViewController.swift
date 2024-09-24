//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import UIKit
import Combine

class MainViewController: UIViewController {

    private var mainView = MainView()
    private var affairsDataSource: [String] = []
    private var currentInterval = IntervalValue.short
    private var mainViewModel: MainViewModel
    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: MainViewModel) {
        self.mainViewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.affairsTableView.dataSource = self
        mainView.affairsTableView.delegate = self
        mainView.addButtonTapped = addButtonTapped
        mainView.intervalLabelTapped = intervalLabelTapped
        mainView.intervalLabel.text = currentInterval.displayLabelText
        mainView.startButtonTapped = startButtonTapped
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func intervalLabelTapped() {
        let nextIndex = (currentInterval.rawValue + 1) % 4
        if let nextInterval = IntervalValue(rawValue: nextIndex) {
            currentInterval = nextInterval
            UIView.transition(with: mainView.intervalLabel, duration: 0.25, options: .transitionCrossDissolve, animations: {
                self.mainView.intervalLabel.text = self.currentInterval.displayLabelText
            }, completion: nil)
        }
    }

    func setupBindings() {
        mainViewModel.$timeDisplay
            .receive(on: DispatchQueue.main)
            .map { $0 as String? }
            .assign(to: \.text, on: mainView.timerLabel)
            .store(in: &cancellables)
    }

    func startButtonTapped() {
        mainViewModel.startPomodoro(with: currentInterval, affairs: affairsDataSource)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        affairsDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AffairsTableViewCell.reuseIdentifier,
            for: indexPath) as? AffairsTableViewCell else {
            return UITableViewCell()
        }

        cell.configureCell(with: affairsDataSource[indexPath.row])
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var backgroundConfig = cell.defaultBackgroundConfiguration()
        backgroundConfig.backgroundColor = UIColor(red: 20/255, green: 24/255, blue: 41/255, alpha: 1.0)
        backgroundConfig.cornerRadius = 20
        backgroundConfig.backgroundInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        backgroundConfig.strokeColor = UIColor(red: 40/255, green: 42/255, blue: 60/255, alpha: 1.0)
        backgroundConfig.strokeWidth = 1.0

        cell.backgroundConfiguration = backgroundConfig
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func addButtonTapped() {
        let alertController = UIAlertController(title: "Добавить задачу", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }

        let addAction = UIAlertAction(title: "Добавить", style: .default) {[weak self] _ in

            if let text = alertController.textFields?.first?.text, !text.isEmpty {

                self?.affairsDataSource.append(text)
                self?.mainView.affairsTableView.reloadData()
            }
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

