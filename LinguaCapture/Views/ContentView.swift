import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var flashcards: [FlashcardEntry]
    @State private var isShowingCamera = false
    @State private var capturedImageData: Data?
    @State private var ocrResults: [String]?
    @State private var isShowingOCRResults = false

    private let ocrService = OCRService()

    var body: some View {
        NavigationStack {
            List {
                ForEach(flashcards) { flashcard in
                    VStack(alignment: .leading) {
                        Text(flashcard.originalText)
                            .font(.headline)
                        Text(flashcard.translatedText ?? "No translation")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Vocabulary")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isShowingCamera.toggle()
                    }) {
                        Image(systemName: "camera.fill")
                    }
                    .accessibilityIdentifier("cameraButton")
                }
            }
            .sheet(isPresented: $isShowingCamera) {
                CameraView { imageData in
                    self.isShowingCamera = false
                    guard let data = imageData else { return }
                    self.capturedImageData = data

                    ocrService.performOCR(on: data) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let strings):
                                self.ocrResults = strings
                                self.isShowingOCRResults = true
                            case .failure(let error):
                                print("OCR Error: \(error.localizedDescription)")
                                self.ocrResults = [] // Represent error as empty results for now
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowingOCRResults) {
                if let imageData = capturedImageData, let results = ocrResults {
                    OCRResultsView(imageData: imageData, recognizedStrings: results)
                }
            }
            .overlay {
                if flashcards.isEmpty {
                    ContentUnavailableView(
                        "No Vocabulary Yet",
                        systemImage: "doc.text.magnifyingglass",
                        description: Text("Tap the capture button to add your first word.")
                    )
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: FlashcardEntry.self, inMemory: true)
}
