import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var flashcards: [FlashcardEntry]
    @State private var isShowingCamera = false

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
                CameraView()
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
