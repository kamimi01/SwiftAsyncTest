//
//  ContentView.swift
//  SwiftAsyncTest
//
//  Created by Mika Urakawa on 2021/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        
        if viewModel.articleLists.isEmpty {
            // APIとの通信が完了するまでは、
            Text("描画中")
        } else {
            Text(viewModel.articleLists.first?["title"] as? String ?? "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
