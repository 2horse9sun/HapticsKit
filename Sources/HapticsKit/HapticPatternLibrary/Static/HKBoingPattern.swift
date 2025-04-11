//
//  HKBoingPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import CoreHaptics

public struct HKBoingPattern: HKHapticPattern {
    public let name = "Boing"
    public let detail = "A continuous event tweaked by sloped parameter curves, emphasized by a precisely placed transient event, creating the feeling of a spring or rubberband."
    public let category: HKHapticPatternCategory = .static
    
    public init() {
        
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.4)
                    ],
                    relativeTime: 0.015,
                    duration: 0.25
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticSharpnessControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.015, value: 0.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.265, value: -0.3)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.015, value: 1.0),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.115, value: 0.5),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.265, value: 0.0)
                    ],
                    relativeTime: 0.0
                )
            ]
        )
    }
}
