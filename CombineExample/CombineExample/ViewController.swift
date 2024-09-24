//
//  ViewController.swift
//  CombineExample
//
//  Created by Азат Зиганшин on 07.04.2024.
//

import UIKit
import Combine

struct User: Decodable {
    let name: String
    let age: Int
}

class ViewModel {

    var cancellables: Set<AnyCancellable> = []

    @Published var users: [User] = [User(name: "Azat", age: 19),
                         User(name: "Almaz", age: 20),
                         User(name: "Raim", age: 19)]

    var birthDayDateSubject: PassthroughSubject<Date, Never> = PassthroughSubject()
    let userService = UserService()

    func addUser() {
        users.append(User(name: "New user", age: Int.random(in: 0 ..< 100)))
    }

    func getBirthDayDate() {
        let date = Date()
        birthDayDateSubject.send(date)
    }

    func obtainUsers() {
        userService.obtainData()
            .subscribe(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error): break
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}

class ViewController: UIViewController {

    @Published var isTextLabelVisible: Bool = false

    var cancellables: Set<AnyCancellable> = []

    let viewModel = ViewModel()

    lazy var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "123"

        return label
    }()

    lazy var actionButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Press", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        let action = UIAction { [weak self] _ in
            // self?.isTextLabelVisible.toggle()
            self?.viewModel.addUser()
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center

        return stackView
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = "Password"

        return textField
    }()

    func configureBindings() {
        viewModel.$users
            .sink { [weak self] users in
                for user in users {
                    self?.addUserLabel(by: user)
                }
            }
            .store(in: &cancellables)

        textField.textPublisher
            .debounce(for: 0.5, scheduler: DispatchQueue.main) // реагирует на нажатие спустя какое-то указанное время
            .map({ $0.count > 5 })   // можно сделать регулярное выражение для проверки пароля на валидность
            .sink { value in
                print("This password is valid: \(value)")
            }
            .store(in: &cancellables)

        viewModel.birthDayDateSubject.sink { date in
            print(date)
        }
        .store(in: &cancellables)

        // Можно соединять
        textField.textPublisher.combineLatest(viewModel.$users)
            .sink { text, users in

            }
            .store(in: &cancellables)
        Publishers.Zip(textField.textPublisher, viewModel.$users).sink { text, users in
            // Тут именно дожидается, чтобы оба сработали
        }
        .store(in: &cancellables)
    }

    func addUserLabel(by user: User) {

        guard stackView.subviews
            .map({ $0 as? UILabel})
            .filter({ $0?.text == String(user.age) })
            .isEmpty else { return }

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(user.age)
        label.font = .systemFont(ofSize: 22)

        stackView.addArrangedSubview(label)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow

//        let publisher = Just("Hello")
//        publisher.sink { value in
//            print(value)
//        }
//
//        let arrayPublisher = [1, 2, 3].publisher
//        arrayPublisher.sink { value in
//            print(value)
//        }

//        view.addSubview(textLabel)
//        view.addSubview(actionButton)
//        view.addSubview(stackView)
        view.addSubview(textField)

        NSLayoutConstraint.activate([
//            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//
//            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            actionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20)
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])

//        NotificationCenter.Publisher(center: .default, name: .userNameChanged)
//            .map({ $0.object as? String })
//            .sink { value in
//                self.textLabel.text = value
//            }
//            .store(in: &cancellables)

//        let namePublisher = NotificationCenter.Publisher(center: .default, name: .userNameChanged)
//            .map({ $0.object as? String })
//        namePublisher
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.text, on: textLabel)
//            .store(in: &cancellables)

//        $isTextLabelVisible.sink { [weak self]  isVisible in
//            self?.textLabel.isHidden = isVisible
//        }
//        $isTextLabelVisible.assign(to: \.isHidden, on: textLabel)
//        .store(in: &cancellables)

        configureBindings()
        viewModel.getBirthDayDate()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        NotificationCenter.default.post(name: .userNameChanged, object: "Azat")
    }
}

extension Notification.Name {
    static let userNameChanged = Notification.Name("userNameChanged")
}

extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)
            .compactMap({ $0.object as? UITextField })
            .map({ $0.text ?? "" })
            .eraseToAnyPublisher()
    }
}
