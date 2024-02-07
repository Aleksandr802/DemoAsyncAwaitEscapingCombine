//
//  DownloadImageViewModel.swift
//  DemoAsyncAwaitEscapingCombine
//
//  Created by Oleksandr Seminov on 2/6/24.
//

import UIKit
import Combine

class DownloadImageAsyncViewModel: ObservableObject {
    
    @Published var image: UIImage?
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() async {
//        loader.downloadWithEscaping { [weak self] image, error in
//            DispatchQueue.main.async {
//                self?.image = image
//            }
//        }
        
//        loader.downloadWithCombine()
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//                
//            } receiveValue: { [weak self] image in
//                self?.image = image
//            }
//            .store (in: &cancellables)
        
        let image = try? await loader.downloadWithAsync()
        await MainActor.run(body: {
            self.image = image
        })
    }
}
