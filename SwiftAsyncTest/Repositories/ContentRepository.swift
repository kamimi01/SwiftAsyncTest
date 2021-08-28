//
//  ContentRepository.swift
//  SwiftAsyncTest
//
//  Created by Mika Urakawa on 2021/08/25.
//

import Foundation

protocol ContentRepositoryDelegate {
    // 記事を取得する
    func getAllArticles(completionHandler: @escaping ([[String: Any]]) -> Void)
}

class ContentRepository: ContentRepositoryDelegate {
    static let shared = ContentRepository()
    
    // APIクライアントの生成
    private let client = ArticleClient()
    
    // リクエストの発行
    private let request = ArticleApi.ArticleList(keyword: "kamimi01")
    
    // カウントの初期値は0
    let semaphore = DispatchSemaphore(value: 0)
    
    func getAllArticles(completionHandler: @escaping ([[String: Any]]) -> Void) {
        // 記事情報を格納していく
//        var articleLists: [[String: Any]] = []
        
        // 別のスレッドで動いているものをまつためのもの
//        let semaphore = DispatchSemaphore(value: 0)
        
        // リクエストの送信
        client.send(request: request) { result in
            
//            defer {
//                // 片づけ
//                semaphore.signal()
//            }
            
            switch result {
            case let .success(response):

                var articleLists: [[String: Any]] = []

                print(response)
                for article in response.articleContents {
                    let articleList = [
                        "id": article.id,
                        "service": article.service,
                        "title": article.title,
                        "userName": article.userName,
                        "likesCount": article.likesCount,
                        "profileImageUrl": article.profileImageUrl,
                        "url": article.url,
                        "createdDate": article.createdDate
                    ] as [String : Any]

                    articleLists.append(articleList)
                }
                
                completionHandler(articleLists)
                
            case let .failure(error):
                print(error)
            }

        }
        
        // カウントが-1される。0以上になるまで以降の処理を行わない
//        semaphore.wait()
        
        print("レスポンス取得後に出力")
        
//        return articleLists
    }
}
