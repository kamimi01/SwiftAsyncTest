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
            Text("何も取得してない")
        } else {
            Text("テスト")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
