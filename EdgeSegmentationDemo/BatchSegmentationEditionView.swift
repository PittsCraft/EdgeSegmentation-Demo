import SwiftUI
import EdgeSegmentation

private let images = [
    UIImage(resource: .breakfast1),
    UIImage(resource: .breakfast2),
    UIImage(resource: .breakfast3),
//    UIImage(resource: .breakfast4),
]

struct BatchSegmentationEditionView: View {

    @State var index = 0
    @State var coordinators = [SegmentationCoordinator]()

    var image: UIImage {
        images[index]
    }

    var body: some View {
        NavigationStack {
            VStack {
                if !coordinators.isEmpty {
                    Spacer()
                    CoordinatedSegmentationEditorView(coordinator: coordinators[index])
                        .id("coordinated-segmentation-view-\(coordinators[index].image.hash)")
                        .animation(.easeInOut, value: index)
                    Spacer()
                    ImageNavigationMenu(index: $index)
                }
            }
            .navigationDestination(for: String.self) { _ in
                CroppedImages(coordinators: coordinators)
            }
        }
        .onAppear {
            if coordinators.isEmpty {
                coordinators = images.compactMap { SegmentationCoordinator(image: $0) }
            }
        }
    }
}

private struct CroppedImages: View {
    let coordinators: [SegmentationCoordinator]

    var images: [UIImage] {
        coordinators.compactMap { $0.segmentation?.croppedSegmentation()?.image }
    }

    var body: some View {
        LazyVGrid(columns: [GridItem(.fixed(150)), GridItem(.fixed(150))]) {
            ForEach(Array(images.enumerated()), id: \.offset) {
                Image(uiImage: $0.element)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}


private struct ImageNavigationMenu: View {

    @Binding var index: Int

    var body: some View {
        HStack {
            Button(action: { index -= 1 },
                   label: { Text("<") })
            .buttonStyle(BorderedButtonStyle())
            .disabled(index == 0)
            NavigationLink(value: "cropped-images") {
                Image(systemName: "eye")
            }
            .buttonStyle(BorderedButtonStyle())
            Button(action: { index += 1 },
                   label: { Text(">") })
            .disabled(index == images.count - 1)
            .buttonStyle(BorderedButtonStyle())
        }
    }
}
