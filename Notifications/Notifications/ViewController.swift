//
//  ViewController.swift
//  Notifications
//
//  Created by Азат Зиганшин on 15.04.2024.
//

import UIKit

class ViewController: UIViewController {

    let pushNotificationManager = PushNotificationManager()

    lazy var notificationStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var registerForNotificationsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enable Notifications", for: .normal)
        
        let action = UIAction { [weak self] _ in
            Task {
                let _ = try? await self?.pushNotificationManager.registerForNotifications()
                self?.updateNotificationStatus()
            }

            let notification = UNMutableNotificationContent()
            notification.title = "Title"
            notification.body = "Body"
            notification.sound = .defaultCritical

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
            let notificationRequest = UNNotificationRequest(identifier: "custom_id",
                                                            content: notification,
                                                            trigger: trigger)
            UNUserNotificationCenter.current().add(notificationRequest)
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        updateNotificationStatus()
    }

    func updateNotificationStatus() {
        Task {
            let settings = await pushNotificationManager.getNotificationStatus()

            switch settings.notificationCenterSetting {
            case .notSupported, .disabled:
                notificationStatusLabel.text = "Disabled"
            case .enabled:
                notificationStatusLabel.text = "Enabled"
            @unknown default:
                break
            }
        }
    }

    func setupLayout() {
        view.backgroundColor = .systemPink

        view.addSubview(notificationStatusLabel)
        view.addSubview(registerForNotificationsButton)

        NSLayoutConstraint.activate([
            notificationStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            notificationStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            registerForNotificationsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerForNotificationsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registerForNotificationsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}

