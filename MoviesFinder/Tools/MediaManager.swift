//
//  ImageCache.swift
//  MoviesFinder
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import Foundation
import UIKit

class MediaManager {
    
    var imageCache: [String: UIImage] = [:]
    var trailerCache: [Int: URL] = [:]
    
    static var staticImageCache: [String: UIImage] = [:]
    
    func getImage(imageKey: String, size: String, completion: @escaping (_ image: UIImage,_ key: String) -> Void) {
        guard let uiImage = imageCache[imageKey] else {
            APIManager.shared.getImage(endpoint: imageKey, size: size) { (data) in
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageCache[imageKey] = image
                    }
                    completion(image, imageKey)
                }
            }
            
            return
        }
        
        
        completion(uiImage, imageKey)
    }
    
    static func getUnsplashImage(keyword: String, size: String = "", completion: @escaping (_ image: UIImage,_ key: String) -> Void) {
        guard let uiImage = self.staticImageCache[keyword] else {
            APIManager.shared.getUnsplashImage(keyword: keyword) { (imageUrl) in
                if let url = URL(string: imageUrl) {
                    NetworkManager.shared.fetchData(url: url) { (data) in
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.staticImageCache[keyword] = image
                            }
                            completion(image, keyword)
                        }
                    }
                }
            }
            
            return
        }
        
        completion(uiImage, keyword)
    }
    
    
    func getLastTrailer(movieId: Int, completion: @escaping (_ url: URL, _ key: Int) -> Void) {
        guard let videoUrl = trailerCache[movieId] else {
            APIManager.shared.getMovieVideoList(movieId: movieId) { (movieVideoList) in
                if let lastTrailerUrl = movieVideoList.getLastTrailer()?.getYoutubeLink() {
                    self.trailerCache[movieId] = lastTrailerUrl
                    completion(lastTrailerUrl, movieId)
                }
            }
            
            return
        }
        
        completion(videoUrl, movieId)
    }
}
