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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    @MainActor
    func testPerformanceExample() async throws {
        let count = 10
        // This is an example of a performance test case.
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
