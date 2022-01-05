//
//  AppState.swift
//  News
//
//  Created by Paul Odhiambo on 05/01/2022.
//

import Foundation

enum AppState{
    case loading
    case success(articles: [Article])
    case error(error: APIErrors)
}
