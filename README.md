# EdgeSegmentation

A quick and efficient Prompt-In-The-Loop segmentation library for SwiftUI.

## Overview

EdgeSegmentation provides:

- SwiftUI components to integrate segmentation prompt and display seamlessly (iOS 17)
- tools to perform segmentation programmatically (iOS 15)

Backed on [EdgeSAM](https://github.com/chongzhou96/EdgeSAM).

https://github.com/PittsCraft/EdgeSegmentation-Demo/assets/327473/41f81c77-8239-456e-99c6-05bf016a047f

### Features

- All-in-one fully customizable segmentation prompt view
- Segment using draggable box, inclusion and exclusion points
- Drag to share cropped segmentation
- Zoom to position points precisely
- Customizable segmentation overlay displaying path
- Customizable edition decorations
- Fit / fill image display

+ Full control over specific behaviors or exotic UI needs made possible by high modularity

### SwiftUI snippets

Segmentation editor with ability to drag to share

```swift
SegmentationEditor(image: image, draggableSegmentation: true)
```

Segmentation editor with feedback through binding

```swift
@State var segmentation: Segmentation?

func body() -> some View {
   SegmentationEditor(image: image, segmentation: $segmentation)
}
```

Segmentation display (no edition)

```swift
SegmentationView(image: image, segmentation: segmentation)
```

[Contact me](mailto:pierre@pittscraft.com?subject=EdgeSegmentation%20info) for more information
