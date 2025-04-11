//
//  HapticFeedbackModifier.swift
//  HapticsKit
//
//  Created by Xu Feng on 2025/3/15.
//

import SwiftUI
import CoreHaptics
import Combine

public extension View {
    func hapticFeedback<T>(
        _ hapticType: HKHapticPatternType,
        trigger: T
    ) -> some View where T : Equatable {
        modifier(HapticFeedbackModifier(hapticType: hapticType, trigger: trigger, feedbackProvider: nil, condition: nil))
    }

    func hapticFeedback<T>(
        trigger: T,
        _ feedbackProvider: @escaping (T, T) -> HKHapticPatternType?
    ) -> some View where T : Equatable {
        modifier(HapticFeedbackModifier(hapticType: nil, trigger: trigger, feedbackProvider: feedbackProvider, condition: nil))
    }

    func hapticFeedback<T>(
        _ hapticType: HKHapticPatternType,
        trigger: T,
        condition: @escaping (T, T) -> Bool
    ) -> some View where T : Equatable {
        modifier(HapticFeedbackModifier(hapticType: hapticType, trigger: trigger, feedbackProvider: nil, condition: condition))
    }
}

private struct HapticFeedbackModifier<T: Equatable>: ViewModifier {
    var hapticType: HKHapticPatternType?
    var trigger: T
    var feedbackProvider: ((T, T) -> HKHapticPatternType?)?
    var condition: ((T, T) -> Bool)?
    
    @State private var previousTrigger: T
    
    init(hapticType: HKHapticPatternType?, trigger: T, feedbackProvider: ((T, T) -> HKHapticPatternType?)?, condition: ((T, T) -> Bool)?) {
        self.hapticType = hapticType
        self.trigger = trigger
        self.feedbackProvider = feedbackProvider
        self.condition = condition
        _previousTrigger = State(initialValue: trigger)
    }

    func body(content: Content) -> some View {
        if #available(iOS 17.0, macOS 14.0, *) {
            content
               .onChange(of: trigger) { oldValue, newValue in
                    handleTriggerChange(oldValue: oldValue, newValue: newValue)
                }
        } else {
            content
               .onReceive(Just(trigger)) { newValue in
                    let oldValue = previousTrigger
                    previousTrigger = newValue
                    handleTriggerChange(oldValue: oldValue, newValue: newValue)
                }
        }
    }
    
    private func handleTriggerChange(oldValue: T, newValue: T) {
        if let condition = condition, !condition(oldValue, newValue) {
            return
        }
        if let feedbackProvider = feedbackProvider, let hapticType = feedbackProvider(oldValue, newValue) {
            hapticEngine.play(pattern: hapticType.buildAsPattern())
        } else if let hapticType = hapticType {
            hapticEngine.play(pattern: hapticType.buildAsPattern())
        }
    }

}
