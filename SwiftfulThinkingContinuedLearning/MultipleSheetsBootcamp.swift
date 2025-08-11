//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 11/8/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    var id = UUID().uuidString
    var title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: selectedModel("TWO"))
//        }
    }
}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}


#Preview {
    MultipleSheetsBootcamp()
}
