//
//  langkawi_swiftui_iosUITestsLaunchTests.swift
//  langkawi-swiftui-iosUITests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import XCTest

final class langkawi_swiftui_iosUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
