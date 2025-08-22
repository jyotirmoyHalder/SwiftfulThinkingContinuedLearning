//
//  DynamicTypeDemo.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 22/8/25.
//

import SwiftUI

struct DynamicTypeDemo: View {
    
    @ScaledMetric private var size: CGFloat = 24
    
    var body: some View {
        VStack {
//            Group {
//                Text("largeTitle").font(.largeTitle)
//                Text("title").font(.title)
//                Text("title2").font(.title2)
//                Text("title3").font(.title3)
//                Text("headline").font(.headline)
//                Text("subheadline").font(.subheadline)
//                Text("body").font(.body)
//                Text("callout").font(.callout)
//                Text("footnote").font(.footnote)
//                Text("caption").font(.caption)
//                Text("caption2").font(.caption2)
//            }
            
            Group {
                Text("Hello, Dynamic type!")
                    .font(.system(size: 24))
                
                Text("Hello, Dynamic type!")
                    .font(.system(size: size))
            }
        }
        .padding()
    }
}

#Preview {
    DynamicTypeDemo()
}
