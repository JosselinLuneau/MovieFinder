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
    
    func setImage(image: UIImage) {
        self.movieImage.image = image
    }
    
    func setCell(title: String, date: Int, description: String) {
        self.movieDate.text = String(date)
        self.movieTitle.text = title
        self.movieDescription.text = description
        
        
    }
    
    override func prepareForReuse() {
        self.movieImage.image = UIImage(named: "icone")
        
        super.prepareForReuse()
    }
}
