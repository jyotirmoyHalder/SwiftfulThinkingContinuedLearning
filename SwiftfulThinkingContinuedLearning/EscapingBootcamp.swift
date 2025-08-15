//
//  EscapingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 15/8/25.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
        
    }
    
    func downloadData() -> String {
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data : String) -> Void){
        completionHandler("New Data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data : String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            completionHandler("New Data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownnloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
}

struct DownloadResult {
    let data: String
}

typealias DownnloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm: EscapingViewModel = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
