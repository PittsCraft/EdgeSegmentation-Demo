import SwiftUI
import EdgeSegmentation

@available(iOS 16.0, *)
struct BaseSegmentationView_Previews: PreviewProvider {

    struct ImageSegmentationPreview: View {

        init(_ image: ImageResource) {
            self.image = UIImage(resource: image)
        }

        let image: UIImage
        @State var path: SegmentationPath? = nil

        var body: some View {
            BaseSegmentationView(image: image, path: path) { _, _ in }
                .task {
                    do {
                        Segmentor.prepare()
                        let segmentor = Segmentor(for: image)!
                        try await segmentor.processImage()
                        let point = CGPoint(x: 1200, y: 800)
                            .applying(UIKitCoordinates.upOrientedTo(image: image))
                        let input = SegmentationInput(
                            positive: [point]
                        )
                        path = try await segmentor.segmentationPath(for: input)
                    } catch {
                        print(error)
                    }
                }
        }
    }

    static var previews: some View {
        ImageSegmentationPreview(.up)
        ImageSegmentationPreview(.upMirrored)
        ImageSegmentationPreview(.down)
        ImageSegmentationPreview(.downMirrored)
        ImageSegmentationPreview(.left)
        ImageSegmentationPreview(.leftMirrored)
        ImageSegmentationPreview(.right)
        ImageSegmentationPreview(.rightMirrored)
    }
}
