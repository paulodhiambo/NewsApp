//
//  NewsService.swift
//  News
//
//  Created by Paul Odhiambo on 04/01/2022.
//

import Foundation
import Combine

protocol NewsService{
    func request(from endpoint:NewsAPI) ->AnyPublisher<NewsResponse, APIErrors>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint:NewsAPI) ->AnyPublisher<NewsResponse, APIErrors>{
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in APIErrors.unknown}
            .flatMap{data,response -> AnyPublisher<NewsResponse, APIErrors> in
                guard let response = response as? HTTPURLResponse else{
                    return Fail(error: APIErrors.unknown).eraseToAnyPublisher()
                }
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                
                if(200...299).contains(response.statusCode){
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError{_ in APIErrors.decodingErrors}
                        .eraseToAnyPublisher()
                }else{
                    return Fail(error: APIErrors.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
            
        
    }
}
