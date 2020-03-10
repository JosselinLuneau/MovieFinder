//
//  NetworkManager.swift
//  MoviesFinder
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

class NetworkManager {
    
    public static var shared: NetworkManager = NetworkManager()

    // MARK: - Properties

    let session = URLSession.shared
    
    var defaultYoutubeUrl: URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "www.youtube.com"
        urlComponent.path = "/watch"
        
        return urlComponent
    }
    
    
    // MARK: - Method
    
    func fetchData(url: URL, completion: @escaping (Data) -> Void) -> Void {
        self.session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let data = data {
                completion(data)
            }
        }).resume()
    }
    
}
