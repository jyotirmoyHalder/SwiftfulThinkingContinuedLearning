//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 10/8/25.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @GestureState private var rotation1: Angle = .zero // temporary rotation
    @State private var finalRotation: Angle = .zero   // permanent rotation
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotationEffect(finalRotation + rotation1) // combine angles
            .gesture(
                RotateGesture()
                    .updating($rotation1) { value, state, _ in
                        state = value.rotation // Live angle change during gesture
                    }
                    .onEnded { value in
                        finalRotation += value.rotation
                    }
                
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
