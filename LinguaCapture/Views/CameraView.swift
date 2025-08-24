import SwiftUI

struct CameraView: View {
    var onPhotoCaptured: (Data?) -> Void

    var body: some View {
        CameraViewControllerRepresentable(onPhotoCaptured: onPhotoCaptured)
            .edgesIgnoringSafeArea(.all)
    }
}
