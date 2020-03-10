//
//  MovieDTO.swift
//  MoviesFinder
//
//  Created by Josselin Luneau on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

//MARK: - MOVIE LIST

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
    
    // MARK: - METHOD
    
    func transformToMovieList() -> [Movie] {
        if let results = self.results {
            return results.compactMap { (movieDto: MovieDTO) in
                return Movie(id: movieDto.id, title: movieDto.title, description: movieDto.overview,releaseDate: movieDto.releaseDate, posterImage: movieDto.posterPath, backgroundImage: movieDto.backdropPath)
            }
        }
        
        return []
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

// MARK: - MOVIE DETAIL

struct MovieDetailDTO: Decodable {
    let backdropPath: String?
    let genres: [Genre]?
    let id: Int?
    let imdbID, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?

    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case imdbID = "imdb_id"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title

    }
    
    func transformToMovie() -> Movie? {
        guard let id = self.id, let title = self.title, let description = self.overview, let releaseDate = self.releaseDate, let runtime = self.runtime else {
            return nil
        }
        
        return Movie(id: id,
                     title: title,
                     description: description,
                     releaseDate: releaseDate,
                     posterImage: self.posterPath,
                     backgroundImage: self.backdropPath,
                     time: runtime)
    }
}


// MARK: - MOVIE VIDEO LIST

struct MovieVideoListDTO: Codable {
    let id: Int?
    let results: [MovieVideoDTO]
    
    func getTrailers(targetSite: String = "youtube") -> [MovieVideoDTO] {
        return results.filter { (movieVideo) in
            movieVideo.type.lowercased() == "trailer" && movieVideo.site.lowercased() == targetSite
        }
    }
    
    func getLastTrailer() -> MovieVideoDTO? {
        let trailers = self.getTrailers()
        guard let lastTrailer = trailers.last else {
            return nil
        }
        
        return lastTrailer
    }
}

// MARK: - Movie Video
struct MovieVideoDTO: Codable {
    let id, key: String
    let name, site: String
    let size: Int
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case key, name, site, size, type
    }
    
    func getYoutubeLink() -> URL? {
        var ytUrl = NetworkManager.shared.defaultYoutubeUrl
        ytUrl.addQueryItem(name: "v", value: self.key)
        
        return ytUrl.url
    }
}
