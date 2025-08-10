//
//  MagnificationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 10/8/25.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {

    @GestureState private var magnifyBy = 1.0
    @State private var lastAmount: CGFloat = 1.0
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(magnifyBy)
                .gesture(
                    MagnifyGesture()
                        .updating($magnifyBy) { value, state, _ in
                            state = value.magnification
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .scaleEffect(lastAmount * magnifyBy)
//            .gesture(
//                MagnifyGesture()
//                    .updating($magnifyBy) { value, gestureState, transaction in
//                        gestureState = value.magnification
//                    }
//                    .onEnded{ value in
//                        lastAmount *= value.magnification
//                    }
//            )
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
