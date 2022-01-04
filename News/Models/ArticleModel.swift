//
//  ArticleModel.swift
//  News
//
//  Created by Paul Odhiambo on 04/01/2022.
//

import Foundation

struct NewsResponse: Codable,Identifiable {
    var id = UUID()
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let url: String
    let source, title, articleDescription: String
    let image: String
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
