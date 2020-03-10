//
//  MovieGenreListCollectionViewController.swift
//  MoviesFinder
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import UIKit

class MovieGenreListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let reuseIdentifier = "GenreCell"
    let segueIdentifier = "showMovieList"
    let sectionInsets = UIEdgeInsets(top: 50.0,
                                     left: 20.0,
                                     bottom: 50.0,
                                     right: 20.0)
    let itemsPerRow: CGFloat = 2
    
    //    var genres: [[Genre]] = []
    var genres: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // On assigne la délégation
        collectionView.delegate = self
        // on assigne la srouce des données
        collectionView.dataSource = self
        
        // On enregistre la vue (xib, nib) que le table view vas utiliser
        collectionView!.register(UINib(nibName: "GenreCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        // Il faut rafraichir les données pour être sur qu'elle soit chargé
        collectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadDatas()
    }
    

    func loadDatas() {
        APIManager.shared.getGenres { (genres) in
            DispatchQueue.main.async {
                self.genres = genres
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return genres.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GenreCollectionViewCell
        
        // let genre: Genre = genres[indexPath.section][indexPath.item]
        let genre: Genre = genres[indexPath.item]
        
        cell.categoryName.text = genre.name
        
        // Configure the cell
        MediaManager.getUnsplashImage(keyword: genre.name ,completion: { (image, key) in
            if genre.name == key {
                DispatchQueue.main.async {
                    cell.bgImage.image = image
                }
            }
        })
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genre = genres[indexPath.item]
        self.performSegue (withIdentifier: self.segueIdentifier, sender: genre)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == self.segueIdentifier else { return }
        
        if let movieListViewController = segue.destination as? MovieListViewController {
            let genre = sender as! Genre
            movieListViewController.genre = genre
        }
    }
}

// MARK: - Collection View Flow Layout Delegate
extension MovieGenreListCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
