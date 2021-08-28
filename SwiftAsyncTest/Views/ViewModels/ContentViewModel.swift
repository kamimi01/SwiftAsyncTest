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
    
    var contentRepository: ContentRepository
    
    init(contentRepository: ContentRepository = ContentRepository.shared) {
        self.contentRepository = contentRepository
        
        getAllArticles()
    }
    
    private func getAllArticles() {
        contentRepository.getAllArticles { [weak self] result in
            
            // UIのスレッドで更新する（それ以外の処理は非同期で行えるようになった）
            DispatchQueue.main.async {
                self?.articleLists = result
            }

        }
    }
}
