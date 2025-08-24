import XCTest
import UIKit
@testable import LinguaCapture

class OCRServiceTests: XCTestCase {

    func testPerformOCR_withTextImage_shouldReturnRecognizedText() {
        // 1. Create a UIImage with text
        let testImage = createImage(withText: "Hello, World!")

        // 2. Convert to Data
        guard let imageData = testImage.pngData() else {
            XCTFail("Failed to create test image data")
            return
        }

        // 3. Set up expectation
        let expectation = self.expectation(description: "OCR completes")

        // 4. Perform OCR
        let ocrService = OCRService()
        ocrService.performOCR(on: imageData) { result in
            switch result {
            case .success(let strings):
                // 5. Assert results
                // The OCR might not be perfect, so we check if any of the results contain the text.
                let found = strings.contains { $0.contains("Hello") || $0.contains("World") }
                XCTAssertTrue(found, "Recognized text should contain 'Hello, World!'")
            case .failure(let error):
                XCTFail("OCR failed with error: \(error)")
            }
            expectation.fulfill()
        }

        // 6. Wait for expectation
        waitForExpectations(timeout: 10, handler: nil) // Increased timeout for OCR
    }

    private func createImage(withText text: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 400, height: 100))
        let img = renderer.image { ctx in
            // Fill background with white
            UIColor.white.setFill()
            ctx.fill(CGRect(x: 0, y: 0, width: 400, height: 100))

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.black
            ]

            let attributedString = NSAttributedString(string: text, attributes: attrs)
            attributedString.draw(with: CGRect(x: 0, y: 30, width: 400, height: 100), options: .usesLineFragmentOrigin, context: nil)
        }
        return img
    }
}
