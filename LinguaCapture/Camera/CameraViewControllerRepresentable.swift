import SwiftUI

struct CameraViewControllerRepresentable: UIViewControllerRepresentable {
    var onPhotoCaptured: (Data?) -> Void

    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.onPhotoCaptured = onPhotoCaptured
        return controller
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        // No update logic needed for this simple case
    }
}
