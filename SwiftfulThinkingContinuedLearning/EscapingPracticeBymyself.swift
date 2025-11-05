//
//  EscapingPracticeBymyself.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by jyotirmoy_halder on 5/11/25.
//

import SwiftUI

class EscapingPracticeViewModel: ObservableObject {
    @Published var text: String = "Hello World"
    
    func getData() {
        downloadData { [weak self] (downloadedDataModel) in
            self?.text = downloadedDataModel.text
        }
    }
    
    func downloadData(completionHaldler: @escaping DownloadCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResultModel(text: "Hello World from DispatchQueue.main.asyncAfter")
            completionHaldler(result)
        }
    }
}

struct DownloadResultModel {
    let text: String
}

typealias DownloadCompletionHandler = (DownloadResultModel) -> ()

struct EscapingPracticeBymyself: View {
    
    @StateObject var vm  = EscapingPracticeViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .bold()
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingPracticeBymyself()
}
