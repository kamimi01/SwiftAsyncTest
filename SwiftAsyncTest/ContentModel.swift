//
//  ContentModel.swift
//  SwiftAsyncTest
//
//  Created by Mika Urakawa on 2021/08/28.
//

import Foundation

class ContentModel {
    
    var contentRepository: ContentRepositoryDelegate?
    
    init(contentRepository: ContentRepositoryDelegate = ContentRepository.shared) {
        self.contentRepository = contentRepository
    }
    
    func getAllRecommendations(completionHander: @escaping ([[String: Any]]) -> Void) {

        contentRepository?.getAllArticles() { result in
            completionHander(result)
        }
    }
}
