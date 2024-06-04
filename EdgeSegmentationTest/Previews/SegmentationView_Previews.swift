import SwiftUI
import EdgeSegmentation

@available(iOS 17.0, *)
struct SegmentationView_Previews: PreviewProvider {

    struct SegmentationPreview: View {

        @StateObject var coordinator: SegmentationCoordinator
        @State var maskedImage: UIImage?

        var body: some View {
            VStack {
                SegmentationView(coordinator: coordinator)
                if let maskedImage {
                    Image(uiImage: maskedImage)
                        .resizable()
                        .scaledToFit()
                }
                if maskedImage == nil {
                    Button(action: {
                        maskedImage = coordinator.segmentationPath?.croppedSegmentation()?.image
                    }, label: {
                        Text("Mask")
                    })
                    .disabled(coordinator.segmentationPath == nil)
                }
            }
            .onChange(of: coordinator.input) { _, _ in
                maskedImage = nil
            }
        }
    }

    struct SegmentationPreviewCoordinatorTask: View {

        init(_ image: ImageResource) {
            self.image = UIImage(resource: image)
        }

        let image: UIImage

        @State var coordinator: SegmentationCoordinator? = nil

        var body: some View {
            VStack {
                if let coordinator {
                    SegmentationPreview(coordinator: coordinator)
                } else {
                    Text("No coordinator yet")
                }
            }
                .task { @MainActor in
                    Segmentor.prepare()
                    coordinator = SegmentationCoordinator(image: image)
                }
        }
    }

    static var previews: some View {
        SegmentationPreviewCoordinatorTask(.up)
        SegmentationPreviewCoordinatorTask(.down)
        SegmentationPreviewCoordinatorTask(.left)
        SegmentationPreviewCoordinatorTask(.right)
        SegmentationPreviewCoordinatorTask(.upMirrored)
        SegmentationPreviewCoordinatorTask(.downMirrored)
        SegmentationPreviewCoordinatorTask(.leftMirrored)
        SegmentationPreviewCoordinatorTask(.rightMirrored)
    }
}
