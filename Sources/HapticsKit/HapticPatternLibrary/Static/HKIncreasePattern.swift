//
//  HKIncreasePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/23.
//

import CoreHaptics

public struct HKIncreasePattern: HKHapticPattern {
    public let name = "Increase"
    public let detail = "A system increase event."
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
