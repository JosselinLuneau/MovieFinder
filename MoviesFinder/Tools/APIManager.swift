//
//  File.swift
//  MoviesFinder
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

class APIManager {
    
    static var shared: APIManager = APIManager()
    
    // MARK: - CONFIG PROPERTIES
    
    lazy var apiKey: String = {
        return "618b019e6dc6fb2ee1b2d1d2a74368ee"
    }()
    
    let baseImageUrl = "https://image.tmdb.org/t/p/w"
    
    var unsplashBaseUrl : URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.unsplash.com"
        urlComponent.queryItems = [
            URLQueryItem(name: "client_id", value: "l3GUxLyHkw0TCx1eAxgxxm9M23IjhEIqETzdHvDrMWU"),
            URLQueryItem(name: "client_secret", value: "B7w0HW7T-9hQCfTkEm0erf8saPONhVBwUE6TbhjEnpg")
        ]

        return urlComponent
    }
    
    var defaultUrl: URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.themoviedb.org"
        urlComponent.path = "/3"
        urlComponent.queryItems = [
            URLQueryItem(name: "api_key", value: APIManager.shared.apiKey),
        ]
        
        return urlComponent
    }
    
    //MARK: - ENUM
    
    enum EndPoint: String {
        case movieList = "/discover/movie"
        case moiveDetail = "/movie/{id}"
        case movieTrailer = "/movie/{id}/videos"
        case movieGenreList = "/genre/movie/list"
        
        case unsplashSearch = "/search/photos"
    }
    
    enum ImageSize: String {
        case medium = "400"
        case wide = "500"
    }
    
    // MARK: - API CALLS
    
    public func getGenres(completion: @escaping ([Genre]) -> Void) -> Void {
        if let url = builRequestUrl(endpoint: EndPoint.movieGenreList.rawValue) {
            NetworkManager.shared.fetchData(url: url) { (data) in
                if let genreListResponse: GenreList = try? JSONDecoder().decode(GenreList.self, from: data) {
                    completion(genreListResponse.genres) // TODO: Get genre with unsplash url
                }
            }
        }
    }
    
    public func getMovies(genreId: Int = -1, page: Int = 1 ,completion: @escaping ([Movie]) -> Void) -> Void {
        if let url = builRequestUrl(endpoint: EndPoint.movieList.rawValue, queries: ["with_genres": genreId, "page": page]) {
            print(url)
            NetworkManager.shared.fetchData(url: url) { (data) in
                if let movieListResponse: MovieListDTO = try? JSONDecoder().decode(MovieListDTO.self, from: data) {
                    completion(movieListResponse.transformToMovieList()) // TODO: refactor (pass class in parameter and create protocol -> func transform)
                }
            }
        }
    }
    
    public func getMovieDetail(movieId: Int, completion: @escaping (Movie) -> Void) -> Void {
        if let url = builRequestUrl(endpoint: EndPoint.moiveDetail.rawValue, parameter:  String(movieId)) {
            NetworkManager.shared.fetchData(url: url) { (data) in
                if let movieDetailResponse: MovieDetailDTO = try? JSONDecoder().decode(MovieDetailDTO.self, from: data) {
                    if let movie = movieDetailResponse.transformToMovie() {
                        completion(movie) // TODO: refactor (pass class in parameter and create protocol -> func transform)
                    }
                }
            }
        }
    }
    
    public func getMovieVideoList(movieId: Int, completion: @escaping (MovieVideoListDTO) -> Void) -> Void {
        if let url = builRequestUrl(endpoint: EndPoint.movieTrailer.rawValue, parameter: String(movieId)) {
            NetworkManager.shared.fetchData(url: url) { (data) in
                if let movieVideoListResponse: MovieVideoListDTO = try? JSONDecoder().decode(MovieVideoListDTO.self, from: data) {
                    completion(movieVideoListResponse)
                }
            }
        }
    }
    
    public func getImage(endpoint: String, size: String, completion: @escaping (Data) -> Void) -> Void {
        if let url = URL(string: builImageUrl(endpoint: endpoint, size: size)) {
            NetworkManager.shared.fetchData(url: url) { (data) in
                completion(data)
            }
            
        }
    }
    
    public func getUnsplashImage(keyword: String, completion: @escaping (String) -> Void) -> Void {
        var unsplashUrl: URLComponents = self.unsplashBaseUrl
        unsplashUrl.path = EndPoint.unsplashSearch.rawValue
        unsplashUrl.addQueryItem(name: "query", value: keyword)
        unsplashUrl.addQueryItem(name: "page", value: "1")
        unsplashUrl.addQueryItem(name: "per_page", value: "1")
        
        if let url = unsplashUrl.url {
            NetworkManager.shared.fetchData(url: url) { (data) in
                if let unsplashImageList: UnsplashImageList = try? JSONDecoder().decode(UnsplashImageList.self, from: data) {
                    if let imageUrls = unsplashImageList.results.first {
                        completion(imageUrls.urls.thumb)
                    }
                }
            }
        }
    }
    
    
    // MARK: PRIVATE METHODS
    
    private func builImageUrl(endpoint: String, size: String) -> String {
        return "\(baseImageUrl)\(size)\(endpoint)"
    }
    
    private func builRequestUrl(endpoint: String, parameter: String = "", queries: [String: Int] = [:]) -> URL? {
        var requestUrl: URLComponents = self.defaultUrl
        
        // build endpoint
        var endpointPath = endpoint
        if !parameter.isEmpty {
            endpointPath = endpoint.replacingOccurrences(of: "{id}", with: parameter)
        }
        
        requestUrl.path += endpointPath
        
        // build query parameters
        if !queries.isEmpty {
            queries.forEach { (key, value) in
                if value > 0 {
                    requestUrl.addQueryItem(name: key, value: String(value))
                }
            }
        }
        
        
        return requestUrl.url
    }
    
}
