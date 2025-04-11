//
//  HKImplodePattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/4/3.
//

import CoreHaptics

public struct HKImplodePattern: HKHapticPattern {
    public let name = "Implode"
    public let detail = "Effect for imploding an object."
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
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
                    ],
                    relativeTime: 0.2,
                    duration: 0.8
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticSharpnessControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.8)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.2, value: 0.5),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 1.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.5, value: 0.6),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.4),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 1.0, value: 0.0)
                    ],
                    relativeTime: 0.0
                )
            ]
        )
    }
}
