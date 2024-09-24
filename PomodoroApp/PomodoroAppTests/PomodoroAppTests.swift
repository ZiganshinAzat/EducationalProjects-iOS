//
//  PomodoroAppTests.swift
//  PomodoroAppTests
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import XCTest
@testable import PomodoroApp

final class PomodoroAppTests: XCTestCase {

    var timerService = PomodoroTimerService()
    var timerFired = false
    var completeFired = false

    override func setUp() {
        super.setUp()

        timerService.onTick = { [weak self] _ in self?.timerFired = true }
        timerService.onComplete = { [weak self] in self?.completeFired = true }
    }

    func testTimerStartsAndFiresEvents() {
        timerService.startTimer(duration: 2)
        let expectation = self.expectation(description: "Кложуры должны сработать")

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 4) { error in
            XCTAssertTrue(self.timerFired, "onTick должен был сработать")
            XCTAssertTrue(self.completeFired, "onComplete должен был сработать")
        }
    }

}
