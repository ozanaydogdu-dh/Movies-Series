//
//  GenreMoviesModel.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 24.05.2021.
//


import Foundation


struct GenreMoviesModel: Codable {
    let genres: [Genre]
}


struct Genre: Codable {
    let id: Int
    let name: String
}
