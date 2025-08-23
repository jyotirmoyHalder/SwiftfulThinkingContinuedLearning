//
//  ScrollViewPagingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 23/8/25.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        
        VStack {
            Button("SCROLL TO") {
                scrollPosition = (0..<20).randomElement()!
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                Text("\(index)").foregroundStyle(Color.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                        // .containerRelativeFrame(.horizontal, alignment: .center)
                    }
                }
                .padding(.vertical, 100)
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
        
        
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                    Rectangle()
////                        .frame(width: 300, height: 300)
//                        .overlay {
//                            Text("\(index)").foregroundStyle(Color.white)
//                        }
//                        .frame(maxWidth: .infinity)
////                        .padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
