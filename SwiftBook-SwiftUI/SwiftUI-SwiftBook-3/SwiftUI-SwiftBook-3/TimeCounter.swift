//
//  TimeCounter.swift
//  SwiftUI-SwiftBook-3
//
//  Created by Азат Зиганшин on 19.08.2024.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
//    @Published var counter = 3
    var counter = 3
    var buttonTitle = "Start"
    var timer: Timer?


    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }

        buttonDidTapped()
    }

    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self)
    }

    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }

    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
