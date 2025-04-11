//
//  HKInflatePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import CoreHaptics

public struct HKInflatePattern: HKHapticPattern {
    public let name = "Inflate"
    public let detail = "A pattern that simulates inflating a balloon."
    public let category: HKHapticPatternCategory = .static
    
    public init() {
        
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
                    ],
                    relativeTime: 0.0,
                    duration: 1.7
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 1.1, value: 0.5),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 1.7, value: 0.0)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticParameterCurve(
                    parameterID: .hapticSharpnessControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: -0.8),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 1.7, value: 0.8)
                    ],
                    relativeTime: 0.0
                )
            ]
        )
    }
}
