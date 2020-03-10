//
//  Movie.swift
//  MoviesFinder
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    var id: Int
    var title: String
    var description: String
    var backgroundImage: String?
    var posterImage: String?
    
    var releaseDate: Int
    var time: Int = 0
    
    let dateFormat = "yyyy-MM-dd"
    
    init(id: Int, title: String, description: String, releaseDate: String, posterImage: String?, backgroundImage: String?, time: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.posterImage = posterImage
        self.backgroundImage = backgroundImage
        self.time = time
        
        let calendar = Calendar.current
        self.releaseDate = calendar.component(.year, from: DateFormatter.getFormattedDateFromString(stringDate: releaseDate, dateFormat: self.dateFormat))
    }
    
    init(id: Int, title: String, description: String, releaseDate: String, posterImage: String?, backgroundImage: String?) {
        self.id = id
        self.title = title
        self.description = description
        self.posterImage = posterImage
        self.backgroundImage = backgroundImage
        
        let calendar = Calendar.current
        self.releaseDate = calendar.component(.year, from: DateFormatter.getFormattedDateFromString(stringDate: releaseDate, dateFormat: self.dateFormat))
    }
    
}
