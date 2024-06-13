# EdgeSegmentation ✂️

A Real-Time ML Powered Segmentation Library for SwiftUI.

## Overview

- **SwiftUI components** to integrate segmentation prompt and display seamlessly (iOS 17)
- tools to perform segmentation **programmatically** (iOS 15)

Backed on [EdgeSAM](https://github.com/chongzhou96/EdgeSAM)

➡️ [Full Documentation](https://pittscraft.com/EdgeSegmentation-Documentation/documentation/edgesegmentation/)

https://github.com/PittsCraft/EdgeSegmentation-Demo/assets/327473/5150e47d-0f88-4ba6-9b36-3605d6af8584


### Features

- **All-in-one** ✨ fully customizable segmentation prompt view
- Segment:
  - drawing a box 📦
  - tapping to add inclusion ✅ and exclusion ❌ points
  - without any extra controls
- Drag to share cropped segmentation ✉️
- Zoom to position points precisely 🔍
- Customizable segmentation overlay displaying path 🎨
- Customizable edition decorations 👨‍🎨
- Fit / fill image display 🏞️ 

➕ Full control to implement specific behaviors or exotic UI needs thanks to a high modularity 👌

### Code snippets

- Segmentation editor with ability to drag to share

```swift
SegmentationEditor(image: image, draggableSegmentation: true)
```

- Segmentation editor with feedback through binding

```swift
@State var segmentation: Segmentation?

func body() -> some View {
   SegmentationEditor(image: image, segmentation: $segmentation)
}
```

- Segmentation display (no edition)

```swift
SegmentationView(image: image, segmentation: segmentation)
```

- Programmatic segmentation

```swift
let segmentor = Segmentor(image: image)
try await segmentor.processImage()

let input = SegmentationInput(positive: [inclusionPoint], negative: [exclusionPoint], box: CGRect(origin: somePoint, size: someSize))
let segmentation = try await segmentor.segmentation(for: input)
// Access CGPath for any display ratio, compute cropped segmentation image...
```

[Contact me](mailto:pierre@pittscraft.com?subject=EdgeSegmentation%20info) for more information
