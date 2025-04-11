//
//  HKOscillatePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import CoreHaptics

public struct HKOscillatePattern: HKHapticPattern {
    public let name = "Oscillate"
    public let detail = "A mixture of two continuous events, shifting the sharpness of one to create a smooth oscillating feel."
    public let category: HKHapticPatternCategory = .dynamic
    
    public var duration: TimeInterval
    public var intensity: Float
    public var frequency: Float
    
    public init(duration: TimeInterval = 2.0, intensity: Float = 1.0, frequency: Float = 0.05) {
        self.duration = duration
        self.intensity = intensity
        self.frequency = frequency
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
                    ],
                    relativeTime: 0.0,
                    duration: duration
                ),
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: frequency)
                    ],
                    relativeTime: 0.0,
                    duration: duration
                )
            ],
            parameterCurves: [

            ]
        )
    }
}
