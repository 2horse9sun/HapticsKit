//
//  HKSpawnPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/4/3.
//

import CoreHaptics

public struct HKSpawnPattern: HKHapticPattern {
    public let name = "Spawn"
    public let detail = "Effect for spawning an object."
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
                ),
                CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
                    ],
                    relativeTime: 0.601
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticSharpnessControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: -0.5),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.5)
                    ],
                    relativeTime: 0.0
                ),
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: [
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.2),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.6, value: 0.7),
                        CHHapticParameterCurve.ControlPoint(relativeTime: 0.601, value: 1.0)
                    ],
                    relativeTime: 0.0
                )
            ]
        )
    }
}
