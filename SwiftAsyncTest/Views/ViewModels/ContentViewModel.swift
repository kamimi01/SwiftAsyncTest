//
//  ContentViewModel.swift
//  SwiftAsyncTest
//
//  Created by Mika Urakawa on 2021/08/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    // 記事情報を格納していく
    @Published var articleLists: [[String: Any]] = []
    
    init() {
        getAllArticles()
    }
    
    let model = ContentModel()
    
    private func getAllArticles() {
        
        model.getAllRecommendations { [weak self] result in
            
            DispatchQueue.main.async {
                self?.articleLists = result
            }
        }

    }
}
