//
//  Movie.swift
//  MoviesFinder
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String
    var description: String
    var image: String?
    
    var releaseDate: Int
    var time: Int
    
    init(title: String, description: String, releaseDate: Int, time: Int, image: String?) {
        self.title = title
        self.description = description
        self.releaseDate = releaseDate
        self.time = time
        self.image = image
    }
}
