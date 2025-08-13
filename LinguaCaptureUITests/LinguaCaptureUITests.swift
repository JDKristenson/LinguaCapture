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

    func testCameraPresentation() throws {
        let app = XCUIApplication()
        app.launch()

        // Tap the camera button
        let cameraButton = app.buttons["cameraButton"]
        XCTAssert(cameraButton.exists)
        cameraButton.tap()

        // Verify that the camera view is presented by checking for its accessibility identifier
        let cameraView = app.otherElements["cameraView"]
        XCTAssert(cameraView.waitForExistence(timeout: 1))
    }
}
