//
//  ContentView.swift
//  DemoAsyncAwaitEscapingCombine
//
//  Created by Oleksandr Seminov on 2/6/24.
//

import SwiftUI

struct DownloadImageAsync: View {
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
    
    var body:
    some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable ()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchImage()
            }
        }
    }
}

#Preview {
    DownloadImageAsync()
}
