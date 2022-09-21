//
//  Endpoints.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation

// change api
struct API {
    static let baseURL = "https://api.themoviedb.org/3/movie/"
}

protocol Endpoint {
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case popular
}

extension Endpoints: Endpoint {

    var path: String {
        switch self {
        case .popular:
            return "popular"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.baseURL)\(path)?api_key=\(APIKEY.key)")!
    }
    
}
