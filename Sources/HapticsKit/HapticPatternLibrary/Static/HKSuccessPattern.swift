//
//  HKSuccessPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/23.
//

import CoreHaptics

public struct HKSuccessPattern: HKHapticPattern {
    public let name = "Success"
    public let detail = "A system success event."
    public let category: HKHapticPatternCategory = .static
    
    public init() {
        
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
                    ],
                    relativeTime: 0.2
                ),
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
                    ],
                    relativeTime: 0.2
                )
            ],
            parameterCurves: [
                
            ]
        )
    }
}
