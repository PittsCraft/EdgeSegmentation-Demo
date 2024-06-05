import SwiftUI
import EdgeSegmentation

struct ContentView: View {

    init() {
        Segmentor.prepare()
    }

    var body: some View {
//        EmptyView()
        TabView {
            SingleSegmentationView()
                .tabItem { Label("Single", systemImage: "person.fill") }
            BatchSegmentationView()
                .tabItem { Label("Batch", systemImage: "person.3.fill") }
        }
    }
}

#Preview {
    ContentView()
}
