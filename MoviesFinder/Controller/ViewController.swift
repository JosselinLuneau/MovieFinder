//
//  ViewController.swift
//  MoviesFinder
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var timeDuration: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var movie: Movie?
    var movieId: Int = -1
    var movieTrailerUrl: URL?
    
    let mediaCache: MediaManager = MediaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIManager.shared.getMovieDetail(movieId: movieId) { (movie) in
            DispatchQueue.main.async {
                // TODO : GET Movie detail
                self.movie = movie
                self.setDetailView()
            }
        }
        
        setDetailView()
    }
    
    func setDetailView() {
        guard let movie = movie else {
            return
        }
        
        releaseDate.text = String(movie.releaseDate)
        timeDuration.text = "\(movie.time) min"
        filmDescription.text = movie.description
        
        if let posterKey = movie.posterImage {
            mediaCache.getImage(imageKey: posterKey, size: "400") { (image, key) in
                if posterKey == key {
                    DispatchQueue.main.async {
                        self.posterImage.image = image
                    }
                }
            }
        }
        
        
        if let backgroundKey = movie.backgroundImage {
            mediaCache.getImage(imageKey: backgroundKey, size: "500") { (image, key) in
                if backgroundKey == key {
                    DispatchQueue.main.async {
                        self.backgroundImage.image = image
                    }
                }
            }
        }
        
        mediaCache.getLastTrailer(movieId: movieId) { (trailerUrl, id) in
            if self.movieId == id {
                DispatchQueue.main.async {
                    self.movieTrailerUrl = trailerUrl
                }
            }
        }
        
    }
    
    @IBAction func playTrailer(_ sender: Any) {
        if let url = self.movieTrailerUrl {
             UIApplication.shared.open(url)
        }
    }
    
}

