//
//  DownloadingImageView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 21/8/25.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader: ImageDownloadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageDownloadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image{
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
        .frame(width: 75, height: 75)
}
