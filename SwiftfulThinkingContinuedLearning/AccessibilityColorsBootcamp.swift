//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 23/8/25.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorScheme
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button ") {
                    
                }
                .foregroundStyle(colorScheme == .increased ? Color.white : Color.primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button ") {
                    
                }
                .foregroundStyle(Color.primary)
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
                
                Button("Button ") {
                    
                }
                .foregroundStyle(Color.white)
                .foregroundStyle(Color.primary)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button ") {
                    
                }
                .foregroundStyle(differentiateWithoutColor ? .white : .green)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .padding()
            .font(.largeTitle)
//            .navigationTitle("Hi")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
