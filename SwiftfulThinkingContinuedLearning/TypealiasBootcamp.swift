//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 15/8/25.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

//struct TVModel {
//    let title: String
//    let director: String
//    let count: Int
//}

// If the model are like same then we an use --- typealias

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Movie Title", director: "Joe", count: 7)
    @State var item: TVModel = TVModel(title: "Movie Title", director: "Joe", count: 7)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title: " + item.title)
            Text("Director: " + item.director)
            Text("Movie count: \(item.count)")
        }
        .font(.largeTitle)
        .bold(true)
    }
}

#Preview {
    TypealiasBootcamp()
}
