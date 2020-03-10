//
//  UnsPlashImage.swift
//  MoviesFinder
//
//  Created by  on 10/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct UnsplashImageList: Codable {
    let results: [UnsplashImage]
}

// MARK: - Result
struct UnsplashImage: Codable {
    let id: String
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
