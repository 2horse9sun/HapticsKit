//
//  HKHapticPatternType.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import Foundation

public enum HKHapticPatternType: Hashable {
    case boing
    case decrease
    case drums
    case error
    case gravel
    case grow
    case heartbeats
    case implode
    case increase
    case inflate
    case intensify(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
    case oscillate(duration: TimeInterval = 1.0, intensity: Float = 1.0, frequency: Float = 0.05)
    case pulse(intensity: Float = 1.0, sharpness: Float = 1.0)
    case rumble
    case sparkle
    case spawn
    case string(intensity: Float = 1.0, sharpness: Float = 1.0, decayTime: Float = 0.8)
    case success
    case texture
    case warning
    case wave(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
    case weaken(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
    
    public func buildAsPattern() -> any HKHapticPattern {
        switch self {
        case .boing:
            return HKBoingPattern()
        case .decrease:
            return HKDecreasePattern()
        case .drums:
            return HKDrumsPattern()
        case .error:
            return HKErrorPattern()
        case .gravel:
            return HKGravelPattern()
        case .grow:
            return HKGrowPattern()
        case .heartbeats:
            return HKHeartbeatsPattern()
        case .implode:
            return HKImplodePattern()
        case .increase:
            return HKIncreasePattern()
        case .inflate:
            return HKInflatePattern()
        case .intensify(let duration, let sharpness):
            return HKIntensifyPattern(duration: duration, sharpness: sharpness)
        case .oscillate(let duration, let intensity, let frequency):
            return HKOscillatePattern(duration: duration, intensity: intensity, frequency: frequency)
        case .pulse(let intensity, let sharpness):
            return HKPulsePattern(intensity: intensity, sharpness: sharpness)
        case .rumble:
            return HKRumblePattern()
        case .sparkle:
            return HKSparklePattern()
        case .spawn:
            return HKSpawnPattern()
        case .string(let intensity, let sharpness, let decayTime):
            return HKStringPattern(intensity: intensity, sharpness: sharpness, decayTime: decayTime)
        case .success:
            return HKSuccessPattern()
        case .texture:
            return HKTexturePattern()
        case .warning:
            return HKWarningPattern()
        case .wave(let duration, let sharpness):
            return HKWavePattern(duration: duration, sharpness: sharpness)
        case .weaken(let duration, let sharpness):
            return HKWeakenPattern(duration: duration, sharpness: sharpness)
        }
    }
}
