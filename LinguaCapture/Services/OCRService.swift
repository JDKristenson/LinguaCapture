import Foundation
import Vision
import UIKit

class OCRService {

    enum OCRServiceError: Error {
        case imageProcessingError
        case ocrRequestError(Error)
        case noTextFound
    }

    func performOCR(on imageData: Data, completion: @escaping (Result<[String], OCRServiceError>) -> Void) {
        guard let uiImage = UIImage(data: imageData), let cgImage = uiImage.cgImage else {
            completion(.failure(.imageProcessingError))
            return
        }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])

        let request = VNRecognizeTextRequest { (request, error) in
            if let error = error {
                completion(.failure(.ocrRequestError(error)))
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation], !observations.isEmpty else {
                completion(.failure(.noTextFound))
                return
            }

            let recognizedStrings = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }

            completion(.success(recognizedStrings))
        }

        request.recognitionLevel = .accurate

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([request])
            } catch {
                completion(.failure(.ocrRequestError(error)))
            }
        }
    }
}
