//
//  PracticeDownloadJSONWithEscaping.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 6/11/25.
//

import SwiftUI

// https://jsonplaceholder.typicode.com/posts/1
// https://jsonplaceholder.typicode.com/posts
/*
 {
   "userId": 1,
   "id": 1,
   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
 }
 */

struct PostModel2: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class PracticeDownloadJSONWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel2] = []
    
    init() {
        getPost()
    }
    
    func downloadDataFromURL(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error downloading data.")
                    completionHandler(nil)
                    return
            }
            completionHandler(data)
        }.resume()
    }
    
    func getPost() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadDataFromURL(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel2].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            }
        }
        
        
        /*
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error downloading data.")
                    return
                }
             guard let data = data  else {
                 print("NO DATA")
                 return
             }
             guard error == nil else {
                 print("Error is: \(String(describing: error))")
                 return
             }
             guard let response = response as? HTTPURLResponse else {
                 print("Invalid HTTP response")
                 return
             }
             guard response.statusCode >= 200 && response.statusCode < 300 else {
                 print("Status code should be 2xx")
                 return
             }
            print("Successfully download data!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPosts = try? JSONDecoder().decode(PostModel2.self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPosts)
            }
        }
        .resume()
        */
    }
}

struct PracticeDownloadJSONWithEscaping: View {
    
    @StateObject var vm = PracticeDownloadJSONWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    PracticeDownloadJSONWithEscaping()
}
