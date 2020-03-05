//
//  MovieTableViewCell.swift
//  MoviesFinder
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(image: String?, title: String, date: Int, description: String) {
        self.movieDate.text = String(date)
        self.movieTitle.text = title
        self.movieDescription.text = description
        
        if let urlImage = image {
            if let url = URL(string: urlImage) {
                getImage(from: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async() {
                        self.movieImage.image = UIImage(data: data)
                    }
                }
            } else {
                 self.movieImage.image = UIImage(named: "icone")
            }
        }
    }
    
    func getImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    override func prepareForReuse() {
        self.movieImage.image = nil
        super.prepareForReuse()
    }
}
