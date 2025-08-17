//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 17/8/25.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    
    // Current Time
    /*
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .full
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
    }
     */
    
    // Animation counter
    @State var count: Int = 0

    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
                .ignoresSafeArea()
            
            
            TabView(selection: $count) {
                Content: do {
                    Rectangle()
                        .foregroundStyle(Color.red)
                        .tag(1)
                    Rectangle()
                        .foregroundStyle(Color.blue)
                        .tag(2)
                    Rectangle()
                        .foregroundStyle(Color.green)
                        .tag(3)
                    Rectangle()
                        .foregroundStyle(Color.orange)
                        .tag(4)
                    Rectangle()
                        .foregroundStyle(Color.pink)
                        .tag(5)
                }
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
            
//                HStack(spacing: 15) {
//                    Circle()
//                        .offset(y: count == 1 ? -20: 0)
//                    Circle()
//                        .offset(y: count == 2 ? -20: 0)
//                    Circle()
//                        .offset(y: count == 3 ? -20: 0)
//                }
//                .frame(width: 150)
//                .foregroundStyle(Color.white)
            
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(Color.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
        }
        .onReceive(timer) { _ in
//            updateTimeRemaining()
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        
        }
    }
}

#Preview {
    TimerBootcamp()
}
