//
//  DiscoverModel.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import Foundation

// MARK: - Discover
struct Discover {
    let page: Int
    let results: [Movie]
    let totalResults, totalPages: Int
    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Movie {
    let posterPath: NSNull
    let adult: Bool
    let overview, releaseDate: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: OriginalLanguage
    let title: String
    let backdropPath: NSNull
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
    }
}

enum OriginalLanguage {
    case en
}
