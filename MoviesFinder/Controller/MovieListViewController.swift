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
    
    var movies: [Movie]
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
    
    let segueIdentifier: String = "showDetail"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        APIManager.shared.getMovies { (movies) in
            self.movies = movies
        }
        
        // On assigne la délégation
        tableView.delegate = self
        // on assigne la srouce des données
        tableView.dataSource = self
        
        // On enregistre la vue (xib, nib) que le table view vas utiliser
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MovieCellID")
        
        movies.forEach { (movie) in
            movies.append(movie)
        }
        
        // Il faut rafraichir les données pour être sur qu'elle soit chargé
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellID", for: indexPath) as! MovieTableViewCell // on force le cast car on sait qu'elle instance on a (définit dans le register)

        
        let movie: Movie = self.movies[indexPath.item]
        
        cell.setCell(image: movie.image, title: movie.title, date: movie.releaseDate, description: movie.description)
        
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.01 * Double(indexPath.row),
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
            viewController.show(viewController, sender: self)
        }
        
    }
    
    @IBAction func onRefresh(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
