//
//  MovieDTO.swift
//  MoviesFinder
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

struct MovieListDTO: Decodable {
    // MARK: - PROPERTIES
    
    let page, totalResult, totalPages: Int
    let results: [MovieDTO]?
    
    // MARK: - CONFIGKEYS
    enum CodingKeys: String, CodingKey {
        case totalResult = "total_results"
        case totalPages = "total_pages"
        case page
        case results
    }
}

struct MovieDTO: Decodable {
    // MARK: - PROPERTIES
    
    let posterPath: String?
    let adult: Bool
    let overview, releaseDate: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle, originalLanguage, title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
