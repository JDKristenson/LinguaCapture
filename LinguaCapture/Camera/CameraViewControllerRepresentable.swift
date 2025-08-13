import SwiftUI

struct CameraViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> CameraViewController {
        return CameraViewController()
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        // No update logic needed for this simple case
    }
}
