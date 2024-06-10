//
//  EdgeSegmentationDemoTests.swift
//  EdgeSegmentationDemoTests
//
//  Created by Pierre Mardon on 04/06/2024.
//

import XCTest
import EdgeSegmentation
@testable import EdgeSegmentationDemo

final class EdgeSegmentationDemoTests: XCTestCase {

    @MainActor
    // Comment all UI before starting this test
    func testPerformanceExample() async throws {
        let count = 10
        Segmentor.prepare()
        let image = UIImage(resource: .init(name: "breakfast-1", bundle: .edgeSegmentationDemo))
        let start = Date().timeIntervalSince1970
        for i in 0..<count {
            let segmentor = Segmentor(for:image )!
            try await segmentor.processImage()
        }
        let end = Date().timeIntervalSince1970
        print("Time: \((end - start) / Double(count))")
    }

}
