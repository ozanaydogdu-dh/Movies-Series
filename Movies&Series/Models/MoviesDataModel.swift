//
//  MoviesDataModel.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 17.05.2021.
//

import Foundation

struct MoviesDataModel: Codable {
    let filmler: [Movies]
}

struct Movies: Codable {
    let genreIdArray: [Int]
    let id: Int
    let overview: String
    let releaseDate: String
    let name: String
    let rating: Float
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case genreIdArray = "genre_ids"
        case id
        case overview
        case name = "original_title"
        case releaseDate = "release_date"
        case rating = "vote_average"
        case imageURL = "poster_path"
    }
}
