//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 22/8/25.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    
    @ScaledMetric private var size: CGFloat = 24

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: size))
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        Text("This is some longer text that expands to multiplelines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .truncationMode(.head)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    }
//                    .frame(height: 100)
                    .background(Color.red)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello, world!")
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
