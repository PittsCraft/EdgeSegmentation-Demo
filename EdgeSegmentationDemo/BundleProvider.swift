//
//  BundleProvider.swift
//  EdgeSegmentationDemo
//
//  Created by Pierre Mardon on 04/06/2024.
//

import Foundation

class BundleProvider {}

public extension Bundle {
    static let edgeSegmentationDemo: Bundle = .init(for: BundleProvider.self)
}
