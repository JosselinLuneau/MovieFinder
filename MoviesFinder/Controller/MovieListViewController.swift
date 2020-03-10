//
//  MovieListViewController.swift
//  MoviesFinder
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 usmb. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    //[Movie(title: "Inssaisissable",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2013,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/51p1OUtPMgL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/514M5sadZFL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Les Visiteurs 2",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2013,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/51p1OUtPMgL._AA256_.jpg"
    //        ),
    //                           Movie(title: "La Terre Outragée",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2013,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/51p1OUtPMgL._AA256_.jpg"
    //        ),
    //                           Movie(title: "La ligne verte",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2013,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/51p1OUtPMgL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/514M5sadZFL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/514M5sadZFL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/514M5sadZFL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: "https://m.media-amazon.com/images/I/514M5sadZFL._AA256_.jpg"
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: nil
    //        ),
    //                           Movie(title: "Le Roi Lion",
    //                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
    //                                 releaseDate: 2003,
    //                                 time: 128,
    //                                 image: nil
    //        ),
    //    ]
    // l
    
    @IBOutlet weak var genreName: UILabel!
    
    var genre: Genre? = nil
    var pagination: Int = 1
    var count: Int = 0
    
    let segueIdentifier: String = "showDetail"
    let reuseIdentifier: String = "MovieCellID"
    
    let mediaCache: MediaManager = MediaManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.genreName.text = genre?.name
        
        // get first page of movies from these genre
        APIManager.shared.getMovies(genreId: self.genre!.id) { (movies) in
            self.movies = movies
            
            // we refresh datas because of asynchron task
            DispatchQueue.main.async() {
                self.tableView.reloadData() // reload data 
            }
        }
        
        // On assigne la délégation
        tableView.delegate = self
        // on assigne la srouce des données
        tableView.dataSource = self
        
        // On enregistre la vue (xib, nib) que le table view vas utiliser
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: reuseIdentifier)
        
        // Il faut rafraichir les données pour être sur qu'elle soit chargé
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MovieTableViewCell // on force le cast car on sait qu'elle instance on a (définit dans le register)
        
        let movie: Movie = self.movies[indexPath.item]
        
        cell.setCell(title: movie.title, date: movie.releaseDate, description: movie.description)
        if let imageEndpoint = movie.posterImage {
            mediaCache.getImage(imageKey: imageEndpoint, size: "300") { (image, key) in
                if imageEndpoint == key {
                    DispatchQueue.main.async {
                        cell.setImage(image: image)
                    }
                }
            }
        }
        
        if indexPath.item > (self.count - 19) {
            self.count += 40
            self.pagination += 1
            APIManager.shared.getMovies(genreId: self.genre!.id, page: self.pagination) { (movies) in
                // we refresh datas because of asynchron task
                DispatchQueue.main.async() {
                    self.movies += movies // merge new movie list to the old one
                    self.tableView.reloadData()
                    self.count = self.movies.count                }
            }
        }
        
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0.05,
            animations: {
                cell.alpha = 1
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.item]
        self.performSegue (withIdentifier: self.segueIdentifier, sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == self.segueIdentifier else { return }
        
        if let viewController = segue.destination as? ViewController {
            let movie = sender as! Movie
            viewController.movie = movie
            viewController.movieId = movie.id
        }
        
    }
    
    
    @IBAction func onRefresh(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
}
