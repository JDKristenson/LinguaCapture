import XCTest

final class LinguaCaptureUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Assert that the main view is showing the navigation title "Vocabulary"
        XCTAssert(app.navigationBars["Vocabulary"].exists)
    }
}
