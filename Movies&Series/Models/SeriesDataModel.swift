//
//  SeriesDataModel.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 17.05.2021.
//




import Foundation

// MARK: - Welcome
struct SeriesDataModel: Codable {
    let page: Int
    let results: [ResultSeries]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultSeries: Codable {
    let backdropPath, firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let originCountry: [OriginCountry]
    let originalLanguage: OriginalLanguage
    let originalName, overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginCountry: String, Codable {
    case co = "CO"
    case mx = "MX"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
}
