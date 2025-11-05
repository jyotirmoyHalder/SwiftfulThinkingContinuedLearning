//
//  CodablePractice.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 5/11/25.
//

import SwiftUI

// Codable = Decodable + Encodable

struct PassengerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    init (from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodablePracticeViewModel: ObservableObject {
//    @Published var passenger: PassengerModel? = PassengerModel(id: "1212", name: "jyotirmoy", points: 5, isPremium: true)
    @Published var passenger: PassengerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
//        print("JSON DATA")
//        print(data)
//        let jsonString = String(data: data, encoding: .utf8)
//        print(jsonString)
        
        do {
            self.passenger = try JSONDecoder().decode(PassengerModel.self , from: data)
        } catch let error {
            print("Error Decoding \(error)")
        }
        
//        if  let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            let newPassenger = PassengerModel(id: id, name: name, points: points, isPremium: isPremium)
//            passenger = newPassenger
//        }
        
               
    }
    
    func getJSONData() -> Data? {
        
        let passenger = PassengerModel(id: "1221111", name: "Joy", points: 45, isPremium: true)
        
        let jsonData = try? JSONEncoder().encode(passenger)
        
//        let dictionary: [String: Any] = [
//            "id": "221122",
//            "name": "jyotirmoy",
//            "points": 5,
//            "isPremium": true
//        ]
//        
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        
        return jsonData
    }
    
}

struct CodablePractice: View {
    
    @StateObject private var vm = CodablePracticeViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            if let passenger = vm.passenger {
                Text(passenger.id)
                Text(passenger.name)
                Text("\(passenger.points)")
                Text(passenger.isPremium.description)
            }
        }
    }
}

#Preview {
    CodablePractice()
}
