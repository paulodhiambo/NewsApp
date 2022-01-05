//
//  APIError.swift
//  News
//
//  Created by Paul Odhiambo on 04/01/2022.
//

import Foundation

enum APIErrors: Error{
    case decodingErrors
    case errorCode(Int)
    case unknown
}

extension APIErrors: LocalizedError{
    var errorDescription: String?{
        switch self {
        case .decodingErrors:
            return "Failed to decode the object from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "Unknown error occurred"
        }
    }
}
