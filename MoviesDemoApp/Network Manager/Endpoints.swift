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
    case movie(id: Int?)
}

extension Endpoints: Endpoint {

    var path: String {
        switch self {
        case .discover:
            return "discover/movie"
        case .movie(let id):
            return "movie\(id == nil ? "" : "/\(id ?? 0)")"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.baseURL)\(path)?api_key=\(APIKEY.key)")!
    }
    
}
