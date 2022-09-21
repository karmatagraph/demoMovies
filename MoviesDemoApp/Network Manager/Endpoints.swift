//
//  Endpoints.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation

struct API {
    static let baseURL = "https://api.themoviedb.org/3/"
}

protocol Endpoint {
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case discover
}

extension Endpoints: Endpoint {

    var path: String {
        switch self {
        case .discover:
            return "discover/movie"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.baseURL)\(path)?api_key=\(APIKEY.key)")!
    }
    
}
