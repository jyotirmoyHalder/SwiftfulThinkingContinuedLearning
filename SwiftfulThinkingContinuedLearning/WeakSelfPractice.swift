//
//  WeakSelfPractice.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 5/11/25.
//

import SwiftUI

struct WeakSelfPractice: View {
    
    @AppStorage("count2") var count2: Int?
    
    init() {
        self.count2 = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfPracticeSecondScreen()
            }
            .navigationTitle("Screen1")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count2 ?? 0)")
                .font(.largeTitle)
                .bold()
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
        }
    }
}

struct WeakSelfPracticeSecondScreen: View {
    
    @StateObject private var vm = WeakSelfPracticeSecondScreenViewModel()
    
    var body: some View {
        Text("Second Screen")
            .font(.largeTitle)
            .bold()
        
        if let text = vm.text {
            Text(text)
        }
    }
}

class WeakSelfPracticeSecondScreenViewModel: ObservableObject {
    
    @Published var text: String? = nil
    
    init() {
        print("initialize")
        
        let currentCount = UserDefaults.standard.integer(forKey: "count2")
        UserDefaults.standard.set(currentCount + 1, forKey: "count2")
        getData()
    }
    
    deinit {
        print("deinitialize")
        let currentCount = UserDefaults.standard.integer(forKey: "count2")
        UserDefaults.standard.set(currentCount - 1, forKey: "count2")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.text = "Hello from Second Screen"
        }
    }
}

#Preview {
    WeakSelfPractice()
}
