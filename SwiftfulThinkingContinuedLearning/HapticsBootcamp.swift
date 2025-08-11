//
//  HapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 11/8/25.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() // Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") { HapticManager.instance.notification(type: .success) }
            Button("warning") { HapticManager.instance.notification(type: .warning) }
            Button("error") { HapticManager.instance.notification(type: .error) }
            Divider()
            Button("error") { HapticManager.instance.impact(style: .soft)}
            Button("error") { HapticManager.instance.impact(style: .light)}
            Button("error") { HapticManager.instance.impact(style: .medium)}
            Button("error") { HapticManager.instance.impact(style: .rigid)}
            Button("error") { HapticManager.instance.impact(style: .heavy)}

        }
    }
}

#Preview {
    HapticsBootcamp()
}
