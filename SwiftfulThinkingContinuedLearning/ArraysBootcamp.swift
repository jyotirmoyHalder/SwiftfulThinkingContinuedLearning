//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 12/8/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        
        // sort
        /*
//        filteredArray = dataArray.sorted { (user1 , user2) -> Bool in
//            return user1.points < user2.points
//        }
        
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
         */
        
        // filter
        /*
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.name.contains("J")
//        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
         */
        
        // map
        /*
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name ?? "Error"
//        })
        
//        mappedArray = dataArray.map({ $0.name })
        
//        mappedArray = dataArray.compactMap({ (user) -> String? in
//            return user.name
//        })
        
//        mappedArray = dataArray.compactMap({ $0.name })
        */
        
//        let sort = dataArray.sorted(by: { $0.points > $1.points })
//        let filter = dataArray.filter({ $0.isVerified })
//        let map = dataArray.compactMap({ $0.name })
        
        mappedArray = dataArray
                            .sorted(by: { $0.points > $1.points })
                            .filter({ $0.isVerified })
                            .compactMap({ $0.name })
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Jyoti", points: 100, isVerified: true)
        let user2 = UserModel(name: nil, points: 34, isVerified: false)
        let user3 = UserModel(name: "Joe", points: 50, isVerified: true)
        let user4 = UserModel(name: "Nick", points: 20, isVerified: false)
        let user5 = UserModel(name: "Emily", points: 45, isVerified: false)
        let user6 = UserModel(name: "Samantha", points: 60, isVerified: true)
        let user7 = UserModel(name: "Jason", points: 15, isVerified: false)
        let user8 = UserModel(name: "Sarah", points: 70, isVerified: true)
        let user9 = UserModel(name: "Lisa", points: 12, isVerified: true)
        let user10 = UserModel(name: "Steve", points: 67, isVerified: false)
        let user11 = UserModel(name: "Mike", points: 36, isVerified: false)
        let user12 = UserModel(name: "Amanda", points: 48, isVerified: true)
        let user13 = UserModel(name: "Tuli", points: 56, isVerified: true)
        let user14 = UserModel(name: "Pusi", points: 82, isVerified: false)
        let user15 = UserModel(name: "Anonda", points: 99, isVerified: true)
        let user16 = UserModel(name: nil, points: 19, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10,
            user11, user12, user13, user14, user15, user16
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(Color.white)
//                    .padding()
//                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
