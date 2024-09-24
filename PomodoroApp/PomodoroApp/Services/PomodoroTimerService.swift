//
//  TimerService.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation

protocol TimerService {
    func startTimer(duration: Int)
    func stopTimer()

    var onTick: ((Int) -> Void)? { get set }
    var onComplete: (() -> Void)? { get set }
}

class PomodoroTimerService: TimerService {
    private var timer: Timer?
    var durationInSeconds: Int = 0

    var onTick: ((Int) -> Void)?
    var onComplete: (() -> Void)?

    func startTimer(duration: Int) {
        durationInSeconds = duration
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.durationInSeconds > 0 {
                self.durationInSeconds -= 1
                self.onTick?(self.durationInSeconds)
            } else {
                self.stopTimer()
                self.onComplete?()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
