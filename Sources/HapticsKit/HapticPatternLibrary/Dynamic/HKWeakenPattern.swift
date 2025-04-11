//
//  HKWeakenPattern.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/4/4.
//

import Foundation
import CoreHaptics

fileprivate func quadInterpolation(t: Double, numberOfPoints: Int) -> [(Double, Double)] {
    var points: [(Double, Double)] = []
    for i in 0..<numberOfPoints {
        let x = Double(i) / Double(numberOfPoints - 1) * t
        let y = 1 - pow(x / t, 2)
        points.append((x, y))
    }
    return points
}

public struct HKWeakenPattern: HKHapticPattern {
    public let name = "Weaken"
    public let detail = "A single continuous haptic event with decreasing intensity overtime"
    public let category: HKHapticPatternCategory = .dynamic
    
    public var duration: TimeInterval
    public var sharpness: Float
    
    let numberOfPoints = 9
    
    public init(duration: TimeInterval = 1.0, sharpness: Float = 1.0) {
        self.duration = duration
        self.sharpness = sharpness
    }
    
    public func encodeAsCHHapticPattern() throws -> CHHapticPattern {
        let points = quadInterpolation(t: duration, numberOfPoints: numberOfPoints)
        let controlPoints = points.map { point in
            return CHHapticParameterCurve.ControlPoint(relativeTime: point.0, value: Float(point.1))
        }
        return try CHHapticPattern(
            events: [
                CHHapticEvent(
                    eventType: .hapticContinuous,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: 1),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
                    ],
                    relativeTime: 0.0,
                    duration: duration
                )
            ],
            parameterCurves: [
                CHHapticParameterCurve(
                    parameterID: .hapticIntensityControl,
                    controlPoints: controlPoints,
                    relativeTime: 0.0
                )
            ]
        )
    }
}
