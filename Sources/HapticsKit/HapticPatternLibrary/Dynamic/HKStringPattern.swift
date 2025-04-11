//
//  HKStringPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/4/4.
//

import Foundation
import CoreHaptics

public struct HKStringPattern: HKHapticPattern {
    public let name = "String"
    public let detail = "Effect for plucking the string"
    public let category: HKHapticPatternCategory = .dynamic
    
    public var intensity: Float
    public var sharpness: Float
    public var decayTime: Float
    
    let numberOfPoints = 9
    
    public init(intensity: Float = 1.0, sharpness: Float = 1.0, decayTime: Float = 0.8) {
        self.intensity = intensity
        self.sharpness = sharpness
        self.decayTime = decayTime
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {

        return try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness),
                        CHHapticEventParameter(parameterID: .decayTime, value: decayTime),
                        CHHapticEventParameter(parameterID: .sustained, value: 0.0)
                    ],
                    relativeTime: 0.0,
                    duration: 1.5
                )
            ],
            parameterCurves: [

            ]
        )
    }
}
