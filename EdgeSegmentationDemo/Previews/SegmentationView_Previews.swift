import SwiftUI
import EdgeSegmentation

struct SegmentationView_Previews: PreviewProvider {

    struct SegmentationPreview: View {

        init(_ image: ImageResource) {
            self.image = UIImage(resource: image)
        }

        let image: UIImage
        @State var segmentation: Segmentation? = nil

        var body: some View {
            SegmentationView(image: image, segmentation: segmentation) { _, _ in }
                .task {
                    do {
                        let _ = Segmentor.prepare()
                        let segmentor = Segmentor(for: image)!
                        try await segmentor.processImage()
                        let point = CGPoint(x: 1200, y: 600)
                            .applying(UIKitCoordinates.upOrientedTo(image: image))
                        let input = SegmentationInput(
                            positive: [point]
                        )
                        segmentation = try await segmentor.segmentation(for: input)
                    } catch {
                        print(error)
                    }
                }
        }
    }

    static var previews: some View {
        SegmentationPreview(.up)
        SegmentationPreview(.upMirrored)
        SegmentationPreview(.down)
        SegmentationPreview(.downMirrored)
        SegmentationPreview(.left)
        SegmentationPreview(.leftMirrored)
        SegmentationPreview(.right)
        SegmentationPreview(.rightMirrored)
    }
}
