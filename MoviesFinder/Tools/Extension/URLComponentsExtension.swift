//
//  URLComponentsExtension.swift
//  MoviesFinder
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

extension URLComponents {
    
    mutating func addQueryItem(name: String, value: String) {
        if let queryItems = self.queryItems {
            self.queryItems?.append(URLQueryItem(name: name, value: value))
        } else {
            self.queryItems = [
                URLQueryItem(name: name, value: value)
            ]
        }
    }
     
}
