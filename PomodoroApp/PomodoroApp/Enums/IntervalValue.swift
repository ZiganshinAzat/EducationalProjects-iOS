//
//  IntervalValue.swift
//  PomodoroApp
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import Foundation

enum IntervalValue: Int {
    case short = 0
    case medium
    case long
    case pomodoro

    var displayLabelText: String {
        switch self {
        case .short: return "КОРОТКОЕ ВРЕМЯ РАБОТЫ 5 МИН"
        case .medium: return "СРЕДНЕЕ ВРЕМЯ РАБОТЫ 10 МИН"
        case .long: return "БОЛЬШОЕ ВРЕМЯ РАБОТЫ 15 МИН"
        case .pomodoro: return "POMODORO 25 МИН"
        }
    }
}
