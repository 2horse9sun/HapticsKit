//
//  HKHapticEngine.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import SwiftUI
import CoreHaptics

let hapticEngine = HKHapticEngine()

struct HKHapticEngine {
    private var engine: CHHapticEngine?

    public init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }

    public func play(pattern: CHHapticPattern) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            try engine?.start()
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play haptic pattern: \(error.localizedDescription)")
        }
    }
    
    public func play(pattern: any HKHapticPattern) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            try engine?.start()
            let hapticPattern = try pattern.encodeAsCHHapticPattern()
            play(pattern: hapticPattern)
        } catch {
            print("Failed to play haptic pattern: \(error.localizedDescription)")
        }
    }
}
