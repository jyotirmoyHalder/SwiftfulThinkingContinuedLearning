//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 10/8/25.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isCompleted: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
        }
        
        HStack {
            Text("CLICK HERE")
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onLongPressGesture(minimumDuration: 2.0, maximumDistance: 50) {
                    // at the min duration
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                } onPressingChanged: { isPressing in
                    if isPressing {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            isCompleted = true
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSuccess {
                                withAnimation(.easeInOut) {
                                    isCompleted = false
                                }
                            }
                        }
                    }
                }
            
            Text("RESET")
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    isCompleted = false
                    isSuccess = false
                }

        }
        
        
        
        
        
        
        
        
        
        
//        Text(isCompleted ? "COMPLETED" : "NOT COMPLETED")
//            .padding()
//            .padding(.horizontal)
//            .background(isCompleted ? Color.green : Color.gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
////            .onTapGesture {
////                isCompleted.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 500) {
//                isCompleted.toggle()
//            }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
