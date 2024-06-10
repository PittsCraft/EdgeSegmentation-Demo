import SwiftUI
import EdgeSegmentation

struct SegmentationEditor_Previews: PreviewProvider {

    struct SegmentationEditorPreview: View {

        init(_ image: ImageResource) {
            self.image = UIImage(resource: image)
        }

        let image: UIImage

        @State var prepared = false

        var body: some View {
            VStack {
                if prepared {
                    SegmentationEditor(image: image)
                } else {
                    Text("No coordinator yet")
                }
            }
                .task { @MainActor in
                    Segmentor.prepare()
                }
        }
    }

    static var previews: some View {
        SegmentationEditorPreview(.up)
        SegmentationEditorPreview(.down)
        SegmentationEditorPreview(.left)
        SegmentationEditorPreview(.right)
        SegmentationEditorPreview(.upMirrored)
        SegmentationEditorPreview(.downMirrored)
        SegmentationEditorPreview(.leftMirrored)
        SegmentationEditorPreview(.rightMirrored)
    }
}
