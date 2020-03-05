//
//  NetworkManager.swift
//  MoviesFinder
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private static var sharedNetworkManager: NetworkManager = {
        return NetworkManager(baseURL: APIManager.shared.defaultUrl)
    }()

    // MARK: - Properties

    var requestURL: URLComponents
    let session = URLSession.shared
    
    // Initialization

    private init(baseURL: URLComponents) {
        self.requestURL = baseURL
    }

    // MARK: - Accessors

    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    // MARK: - Method
    
    func fetchDatas(path: String, completion: @escaping (Data) -> Void) -> Void {
        requestURL.path += path
        if let url = requestURL.url  {
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
}
