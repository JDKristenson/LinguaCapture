import SwiftUI
import SwiftData

@main
struct LinguaCaptureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FlashcardEntry.self)
    }
}
