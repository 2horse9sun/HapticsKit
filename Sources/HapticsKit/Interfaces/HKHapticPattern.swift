//
//  HKHapticPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import SwiftUI
import CoreHaptics

public protocol HKHapticPattern: CHHapticPatternEncodable {
    var name: String { get }
    var detail: String { get }
    var category: HKHapticPatternCategory { get }
}

public enum HKHapticPatternCategory: Hashable {
    case `static`
    case dynamic
}
