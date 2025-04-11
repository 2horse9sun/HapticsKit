//
//  HKDecreasePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/23.
//

import CoreHaptics

public struct HKDecreasePattern: HKHapticPattern {
    public let name = "Decrease"
    public let detail = "A system decrease event."
    public let category: HKHapticPatternCategory = .static
    
    public init() {
        
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
                    ],
                    relativeTime: 0.0
                )
            ],
            parameterCurves: [
                
            ]
        )
    }
}
