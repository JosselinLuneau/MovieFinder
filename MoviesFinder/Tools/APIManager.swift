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
    
    lazy var apiKey: String = {
        return "618b019e6dc6fb2ee1b2d1d2a74368ee"
    }()
    
    let baseUrl = "https://api.themoviedb.org/3"
    
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

    
    public func getMovies(completion: @escaping (MovieListDTO) -> Void) -> Void {
        NetworkManager.shared().fetchDatas(path: "/discover/movie") { (data) in
            if let movieListResponse: MovieListDTO = try? JSONDecoder().decode(MovieListDTO.self, from: data) {
                print(movieListResponse)
                
                completion(movieListResponse)
            }
        }
         
    }
    
}
