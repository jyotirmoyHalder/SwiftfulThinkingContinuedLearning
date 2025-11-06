//
//  PracticeTimerAndReceivedValue.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 6/11/25.
//

import SwiftUI

struct PracticeTimerAndReceivedValue: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current Date
    @State var currentDate: Date = Date()
    // Current Date Formatter
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
//        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    
    // Countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    
    // Countdown to date
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .minute, value: 30, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
//        timeRemaining = "\(hour):\(minute):\(second)"
        timeRemaining = String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    
    // Animation counter
    @State var countForAnimation: Int = 0
    // lets create another time publisher for animation
    let timer2 = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    // Animate Tavview on time
    @State var countTimerTab: Int = 1
    let timer3 = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text(dateFormatter.string(from: currentDate))
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                
                Text(finishedText ?? "\(count)")
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                
                Text(timeRemaining)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                
                HStack(spacing: 15) {
                    Circle()
                        .offset(y: countForAnimation == 1 ? -20 : 0)
                    Circle()
                        .offset(y: countForAnimation == 2 ? -20 : 0)
                    Circle()
                        .offset(y: countForAnimation == 3 ? -20 : 0)
                }
                .frame(width: 150, height: 50)
                .foregroundStyle(Color.white)
                .padding()
                
                TabView(selection: $countTimerTab) {
                    Rectangle()
                        .foregroundStyle(.red)
                        .tag(1)
                    Rectangle()
                        .foregroundStyle(.blue)
                        .tag(2)
                    Rectangle()
                        .foregroundStyle(.pink)
                        .tag(3)
                    Rectangle()
                        .foregroundStyle(.yellow)
                        .tag(4)
                    Rectangle()
                        .foregroundStyle(.purple)
                        .tag(5)
                }
                .frame(height: 200)
                .tabViewStyle(.page)
            }
        }
        .onReceive(timer) { value in
            // updating current date
            currentDate = value
            
            // updating counter & finishedText
            if count <= 1 {
                finishedText = "Wow!"
                count = 11
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    finishedText = nil
                }
            } else {
                count -= 1
            }
            
            // updating Countdown
            updateTimeRemaining()
        }
        .onReceive(timer2) { value in
            withAnimation(.easeInOut(duration: 0.3)) {
                countForAnimation = countForAnimation == 3 ? 0 : countForAnimation + 1
            }
        }
        .onReceive(timer3) { value in
            withAnimation(.default) {
                countTimerTab = countTimerTab == 5 ? 1 : countTimerTab + 1
            }
        }
    }
}

#Preview {
    PracticeTimerAndReceivedValue()
}
