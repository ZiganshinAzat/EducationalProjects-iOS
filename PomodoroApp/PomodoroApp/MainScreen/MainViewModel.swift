//
//  MainViewModel.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation

class MainViewModel {

    private var timerService: TimerService
    private var notificationService: NotificationService
    @Published var timeDisplay: String = "00:00"
    private var tasks: [String] = []
    private var currentTaskIndex: Int = 0
    private var isWorkPhase = true
    private var wordDuration = 0

    init() {
        timerService = ServiceLocator.shared.getService() as TimerService
        notificationService = ServiceLocator.shared.getService() as NotificationService

        timerService.onTick = { [weak self] secondsLeft in
            self?.updateTimeDisplay(secondsLeft: secondsLeft)
        }

        timerService.onComplete = { [weak self] in
            guard let self = self else { return }

            if currentTaskIndex == tasks.count - 1 {
                timeDisplay = "Done!"
                notificationService.scheduleNotification(title: "Поздравляем!", body: "Вы сделали все свои дела", timeInterval: 0.1)
                tasks = []
                currentTaskIndex = 0
                isWorkPhase = true
                wordDuration = 0
                return
            }

            if isWorkPhase == true {
                isWorkPhase.toggle()
                timerService.startTimer(duration: 5)
                notificationService.scheduleNotification(title: "Перерыв", body: "5 минут", timeInterval: 0.1)
            } else {
                isWorkPhase.toggle()
                currentTaskIndex += 1
                timerService.startTimer(duration: wordDuration)
                notificationService.scheduleNotification(title: "Начало новой задачи", body: tasks[currentTaskIndex], timeInterval: 0.1)
            }
        }
    }

    private func updateTimeDisplay(secondsLeft: Int) {
        let minutes = secondsLeft / 60
        let seconds = secondsLeft % 60
        timeDisplay = String(format: "%02d:%02d", minutes, seconds)
    }

    func startPomodoro(with interval: IntervalValue, affairs: [String]) {

        tasks = affairs
        wordDuration = getDuration(interval: interval)
        timerService.startTimer(duration: wordDuration)
        notificationService.scheduleNotification(title: "Начало работы", body: tasks[currentTaskIndex], timeInterval: 0.1)
    }

    private func getDuration(interval: IntervalValue) -> Int {
        switch interval {
        case .short:
            return 5
        case .medium:
            return 10
        case .long:
            return 15
        case .pomodoro:
            return 25
        }
    }
}
