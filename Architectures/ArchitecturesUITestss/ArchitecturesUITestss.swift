//
//  ArchitecturesUITestss.swift
//  ArchitecturesUITestss
//
//  Created by Азат Зиганшин on 08.04.2024.
//

import XCTest
@testable import Architectures

final class ArchitecturesUITestss: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let emailTextField = app.textFields["Email_Text_Field"]

        XCTAssert(emailTextField.exists)
    }
}
