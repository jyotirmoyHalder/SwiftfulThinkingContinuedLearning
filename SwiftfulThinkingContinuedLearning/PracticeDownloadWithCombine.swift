//
//  PracticeDownloadWithCombine.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 6/11/25.
//

import SwiftUI
import Combine

struct PostModel3: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class PracticeDownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel3] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string:  "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel3].self, decoder: JSONDecoder())
        
//            .replaceError(with: [])
//            .sink(receiveValue: { [weak self] (returnedPosts) in
//                self?.posts = returnedPosts
//            })
        
            .sink { (completion) in
                switch(completion) {
                case .finished:
                    print( "Finished")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct PracticeDownloadWithCombine: View {
    
    @StateObject var vm = PracticeDownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    PracticeDownloadWithCombine()
}
