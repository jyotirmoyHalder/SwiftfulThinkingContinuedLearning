//
//  VisualEffectBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 23/8/25.
//

import SwiftUI

@available(iOS 17, *)
struct VisualEffectBootcamp: View {
    
//    @State private var showSpacer: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
        
//        VStack {
//            Text("Hello,dfasdfdsfsdfsafasdfafafafasfdafadfasfadafafdsaadfa world!")
//                .padding()
//                .background(Color.red)
//                .visualEffect { content, geometry in
//                    content
//                    //                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                }
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
    }
}

@available(iOS 17, *)
#Preview {
    VisualEffectBootcamp()
}
