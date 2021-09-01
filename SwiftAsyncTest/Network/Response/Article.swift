//
//  Article.swift
//  ArticleCollection
//
//  Created by Mika Urakawa on 2020/09/30.
//

import Foundation

struct Article: Decodable {
    let id: String
    let service: String
    let title: String
    let userName: String
    let likesCount: Int
    let profileImageUrl: String
    let url: String
    let createdDate: String
}

class ArticleForHome: NSObject {
    var id: String
    var service: String
    var title: String
    var userName: String
    var likesCount: Int
    var profileImageUrl: String
    var url: String
    var createdDate: String
    var isFavorite: Bool = false

    init(article: [String: Any], favoriteIdList: [String]) {
        self.id = article["id"] as! String
        self.service = article["service"] as! String
        self.title = article["title"] as! String
        self.userName = article["userName"] as! String
        self.likesCount = article["likesCount"] as! Int
        self.profileImageUrl = article["profileImageUrl"] as! String
        self.url = article["url"] as! String
        self.createdDate = article["createdDate"] as! String

        if favoriteIdList.contains(article["id"] as! String) {
            self.isFavorite = true
        }
    }
}
