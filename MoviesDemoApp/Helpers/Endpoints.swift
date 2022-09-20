//
//  Endpoints.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation

struct API {
    static let url = "https://api.themoviedb.org/3/movie/"
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
        return URL(string: "\(API.url)\(path)")!
    }
    
}
