//
//  HKGrowPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/4/3.
//

import CoreHaptics

public struct HKGrowPattern: HKHapticPattern {
    public let name = "Grow"
    public let detail = "Effect for growing an object."
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
                    duration: 0.6
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: 1.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.25, value: 1.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.3, value: 0.3),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.0)
                    ],
                    relativeTime: 0.0
                )
            ]
        )
    }
}
