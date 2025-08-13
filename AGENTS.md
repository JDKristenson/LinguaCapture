# LinguaCapture Agent Instructions

This file contains instructions and conventions for developing the LinguaCapture application.

## Development Strategy

As per the PRD, we are following a two-track development strategy:
- **`main` branch:** For the Personal MVP (Track 1).
- **`development` branch:** For the Commercial/Licensing version (Track 2).

This agent will primarily work on the `main` branch to deliver the MVP.

## Technology Stack

- **Platform:** iOS
- **Language:** Swift
- **UI Framework:** SwiftUI
- **OCR:** Apple Vision Framework
- **Database (MVP):** SwiftData
- **Mapping:** MapKit

## Project Structure

A standard SwiftUI application structure will be followed.

- `LinguaCapture/`: Main application source files.
- `LinguaCapture/Views`: SwiftUI views.
- `LinguaCapture/Models`: Data models.
- `LinguaCapture/ViewModels`: View models.
- `LinguaCapture/Services`: Services like location, OCR, etc.
- `LinguaCaptureTests/`: Unit and UI tests.

## Coding Conventions

- Follow standard Swift and SwiftUI conventions.
- Use comments to explain complex logic.
- Keep views small and focused on a single responsibility.
- Use dependency injection where appropriate to facilitate testing.

## Initial Plan

1.  **Set up Project Structure:** Create initial directories and files.
2.  **Define Data Model:** Implement the `FlashcardEntry` model using SwiftData.
3.  **Implement Core Features:**
    - Camera Integration
    - OCR Processing
    - Flashcard Creation Flow
    - Vocabulary List
    - Review Mode
4.  **Integrate Geolocation:** Add location tagging and reverse geocoding.
5.  **Testing:** Add unit tests for business logic and UI tests for key user flows.
