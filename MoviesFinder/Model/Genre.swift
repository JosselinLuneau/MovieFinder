//
//  Genre.swift
//  MoviesFinder
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Welcome
struct GenreList: Decodable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
    let image: String = ""
}

