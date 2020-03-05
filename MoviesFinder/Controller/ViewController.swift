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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let movie: Movie = Movie(title: "Inssaisissable",
                                 description: "Un illusionniste, Daniel Atlas, son ancienne assistante, Henley Reeves, un prestidigitateur pickpocket, Jack Wilder, et un mentaliste hypnotiseur aigrefin, Merritt McKinney, sont recrutés par un mystérieux anonyme. Un an plus tard, ils forment « Les 4 Cavaliers », un groupe d'illusionnistes conduits par le charismatique Daniel Atlas. Ils font d'abord un spectacle à Las Vegas, dans lequel ils surprennent le public en cambriolant, en direct et à distance, une banque en France et en faisant pleuvoir sur le public les billets de banque volés. Puis, à La Nouvelle-Orléans, ils dérobent les millions de leur mécène, Arthur Tressler, un assureur n'ayant pas indemnisé les victimes de l'ouragant Katrina, afin de les répartir sur les comptes bancaires du public, composé d'invités floués par Tressler. Dylan Rhodes, un agent du FBI, est déterminé à arrêter les illusionnistes avant qu'ils mènent à bien un projet de cambriolage beaucoup plus ambitieux, mais il se voit obligé de faire équipe avec Alma Dray, une détective française d'Interpol dont il se méfie immédiatement. Dans son désespoir devant la difficulté de l'enquête, Dylan contacte Thaddeus Bradley, un animateur de télévision qui démonte les tours des magiciens dans ses émissions. Il leur révèle les secrets des illusionnistes, en les assurant que le vol de la banque a été réussi grâce à des déguisements et des trucages vidéo. Dylan et Alma s'accordent finalement sur le fait que « les Quatre Cavaliers » disposent de l'aide d'une cinquième personne et que sa capture est la clé de l'enquête.Alors que la pression monte et que tout le monde attend le spectaculaire show final des « Quatre Cavaliers », Dylan et Alma s'efforcent de coincer le groupe d'illusionnistes." ,
                                 releaseDate: 2013,
                                 time: 128,
                                 image: "")
        
            filmDescription.text = movie.description
    }

    @IBAction func playTrailer(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=LCrRcctYEf4") {
            UIApplication.shared.open(url)
        }
    }
    
}

