import SwiftUI
import EdgeSegmentation

struct SingleSegmentationView: View {

    var body: some View {
        SegmentationContainer(
            image: UIImage(resource: .breakfast3),
            editionConfiguration: .init(draggableSegmentation: true)
        )
    }
}

