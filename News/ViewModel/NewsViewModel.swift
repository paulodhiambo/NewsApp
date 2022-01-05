//
//  NewsViewModel.swift
//  News
//
//  Created by Paul Odhiambo on 05/01/2022.
//

import Foundation
import Combine

protocol NewsViewModel{
    func getArtcles()
}


class NewsViewModelImpl: ObservableObject, NewsViewModel{
    func getArtcles() {
        <#code#>
    }
}
