//
//  NewsService.swift
//  News
//
//  Created by Paul Odhiambo on 04/01/2022.
//

import Foundation
import SwiftUI

protocol APIBuilder{
    var urlRequest:URLRequest { get }
    var baseURL:URL { get }
    var path:String { get }
}

enum NewsAPI{
    case getNews
}


extension NewsAPI: APIBuilder{
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://api.lil.software")!
    }
    
    var path: String {
        return "/news"
    }
}
