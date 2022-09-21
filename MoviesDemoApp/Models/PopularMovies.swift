//
//  PopularMovies.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation

struct PopularMovieResponse: Codable {
    let results: [PopularMovie]
}

struct PopularMovie: Codable {
    let posterPath: String
    let adult: Bool
    let overview, releaseDate: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let title, backdropPath: String
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview,
    }

}



