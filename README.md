# HapticsKit

HapticsKit is an extension to SwiftUI's [`sensoryFeedback` APIs](https://developer.apple.com/documentation/swiftui/sensoryfeedback), including rich predefined and parameterized haptic patterns in addition to system-provided ones. These haptic patterns are created by [Haptics Simulator App](https://apps.apple.com/cn/app/%E8%A7%A6%E6%84%9F%E6%A8%A1%E6%8B%9F%E5%99%A8/id6741039368), which is a great tool to visualize and create customized haptic patterns. Internally, all haptic patterns are represented as `CHHapticPattern` and played by `CHHapticEngine`. (See [CoreHaptics](https://developer.apple.com/documentation/corehaptics/) for detail)

# Usage

The APIs provided by HapitcsKit are pretty much similar to SwiftUI's `sensoryFeedback` APIs.

To play the specified feedback when the provided trigger value changes:
```swift
import HapticsKit

struct MyView: View {
    @State private var playHaptics = false

    var body: some View {
        ContentView()
            .hapticFeedback(.pulse(intensity: 0.5, sharpness: 0.5), trigger: playHaptics)
            .onTapGesture {
                playHaptics.toggle()
            }
    }
}
```

To play feedback when returned from the feedback closure after the provided trigger value changes:
```swift
import HapticsKit

struct MyView: View {
    @State private var phase = Phase.inactive

    var body: some View {
        ContentView(phase: $phase)
            .hapticFeedback(trigger: phase) { old, new in
                switch (old, new) {
                    case (.inactive, _): return .success
                    case (_, .expanded): return .warning
                    default: return nil
                }
            }
    }

    enum Phase {
        case inactive
        case preparing
        case active
        case expanded
    }
}
```

To play the specified feedback when the provided trigger value changes and the condition closure returns true:
```swift
import HapticsKit

struct MyView: View {
    @State private var phase = Phase.inactive

    var body: some View {
        ContentView(phase: $phase)
            .sensoryFeedback(.success, trigger: phase) { old, new in
                old == .inactive || new == .expanded
            }
    }

    enum Phase {
        case inactive
        case preparing
        case active
        case expanded
    }
}
```

# Installation

HapticsKit can be installed from Swift Package Manager by adding the following dependency to `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/2horse9sun/HapticsKit")
]
```

# Requirements

* iOS 13+

Currently, HapticsKit is only available for iOS (actually only for iPhone). Apple Watch does not support playing customized haptic patterns currently.

# Haptic Patterns

There are two categories of haptic patterns available in HapticsKit. 

Static patterns refer to patterns with predefined static parameters. When you specify to play a static pattern, it is supposed to trigger consistant sensory feedback. Here is a list of static patterns available in HapticsKit:
```swift
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
    case rumble
    case sparkle
    case spawn
    case success
    case texture
    case warning
}
```

Dynamic patterns refer to patterns with adjustable dynamic parameters. You are able to create different sensory feedback by adjusting the parameters of the same pattern. Here is a list of dynamic patterns available in HapticsKit:
```swift
public enum HKHapticPatternType: Hashable {
    case intensify(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
    case oscillate(duration: TimeInterval = 1.0, intensity: Float = 1.0, frequency: Float = 0.05)
    case pulse(intensity: Float = 1.0, sharpness: Float = 1.0)
    case string(intensity: Float = 1.0, sharpness: Float = 1.0, decayTime: Float = 0.8)
    case wave(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
    case weaken(duration: TimeInterval = 1.0, sharpness: Float = 1.0)
}
```

# Haptics Visualization

Generally, there are two ways to 'feel' the haptics. The first way is of course to play it on a physical phone. Though accurate, you have to play them one by one to find the best match. The other way is to convert parameters of haptics, e.g. duration/intensity/sharpness, into visual representations, which give you a glance at how a haptic pattern might feel. The combination of both ways will bring the best experience.

To visualize all the patterns provided by HapticsKit, it is recommended to get the [Haptics Simulator App](https://apps.apple.com/cn/app/%E8%A7%A6%E6%84%9F%E6%A8%A1%E6%8B%9F%E5%99%A8/id6741039368). Patterns in HapticsKit are in sync with visualizations on Haptics Simulator App. Actually, Haptics Simulator is fully built on top of HapticsKit.

# How to Contribute

Generally, the contribution can be classified into two categories:

1. Sumbit new static or dynamic haptic patterns
2. Improve other parts of the library

All contributions are welcomed. Feel free to create issues or submit PRs to make HapticsKit better!