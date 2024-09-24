//
//  MainViewSnapshotTests.swift
//  PomodoroAppTests
//
//  Created by Азат Зиганшин on 16.04.2024.
//

import XCTest
import SnapshotTesting
@testable import PomodoroApp

final class MainViewSnapshotTests: XCTestCase {

    func test_On_iPadMini() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)

        assertSnapshot(of: mainViewController, as: .image(traits: .iPadMini))
    }

    func test_On_iPhoneSE() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: mainViewModel)

        assertSnapshot(of: mainViewController, as: .image(traits: .iPhoneSe(.portrait)))
    }
}
