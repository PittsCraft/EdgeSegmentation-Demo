import SwiftUI
import EdgeSegmentation

struct SingleSegmentationView: View {

    var body: some View {
        SegmentationEditor(
            image: UIImage(resource: .breakfast3),
            draggableSegmentation: true
        )
    }
}

