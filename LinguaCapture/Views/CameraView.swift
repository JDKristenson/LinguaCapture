import SwiftUI

struct CameraView: View {
    var body: some View {
        CameraViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}
