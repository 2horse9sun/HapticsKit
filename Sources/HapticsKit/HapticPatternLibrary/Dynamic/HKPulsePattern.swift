//
//  HKPulsePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import CoreHaptics

public struct HKPulsePattern: HKHapticPattern {
    public let name = "Pulse"
    public let detail = "A single transient haptic event with customized intensity and sharpness value"
    public let category: HKHapticPatternCategory = .dynamic
    
    public var intensity: Float
    public var sharpness: Float
    
    public init(intensity: Float = 1.0, sharpness: Float = 1.0) {
        self.intensity = intensity
        self.sharpness = sharpness
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        return try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
                    ],
                    relativeTime: 0.0
                )
            ],
            parameterCurves: [

            ]
        )
    }
}
