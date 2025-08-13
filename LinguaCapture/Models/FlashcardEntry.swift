import Foundation
import SwiftData

@Model
final class FlashcardEntry {
    @Attribute(.unique) var id: UUID
    var timestamp: Date
    var originalText: String
    var translatedText: String?
    @Attribute(.externalStorage) var imageData: Data?
    var latitude: Double?
    var longitude: Double?
    var locationName: String?
    var notes: String?

    init(id: UUID = UUID(),
         timestamp: Date = .now,
         originalText: String,
         translatedText: String? = nil,
         imageData: Data? = nil,
         latitude: Double? = nil,
         longitude: Double? = nil,
         locationName: String? = nil,
         notes: String? = nil) {
        self.id = id
        self.timestamp = timestamp
        self.originalText = originalText
        self.translatedText = translatedText
        self.imageData = imageData
        self.latitude = latitude
        self.longitude = longitude
        self.locationName = locationName
        self.notes = notes
    }
}
