//
//  DownloadingImageRow.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 21/8/25.
//

import SwiftUI

struct DownloadingImageRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(Color.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DownloadingImageRow(model: PhotoModel(albumId: 1, id: 1, title: "title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
        .padding()
}
