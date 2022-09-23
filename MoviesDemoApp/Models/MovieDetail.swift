//
//  MovieDetail.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Decodable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
//    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult, id, budget, genres, homepage, overview, popularity, revenue, runtime, status, tagline, title, video
        case backdropPath = "backdrop_path"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        
    }
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let iso3166_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iso3166_1 = "iso_3166_1"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Decodable {
    let iso639_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iso639_1 = "iso_639_1"
    }
}
