//
//  CHHapticPatternEncodable.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import CoreHaptics

public protocol CHHapticPatternEncodable {
    func encodeAsCHHapticPattern() throws -> CHHapticPattern
}
