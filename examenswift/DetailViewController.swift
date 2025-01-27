//
//  DetailViewController.swift
//  examenswift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var movie: Movie? = nil
    var movieList: [Movie] = []

    @IBOutlet var posterIV: UIImageView!
    
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var plotLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ###############Here I use the imdbID to obtain the information Mansour############## //
        MovieProvider.searchById(query: movie!.imdbID, completionHandler: { [weak self] results in
            self?.movie = results
            
            DispatchQueue.main.async {
                self?.plotLabel.text = self?.movie?.Plot
                self?.yearLabel.text = self?.movie?.Year
                self?.titleLabel.text = self?.movie?.Title
                self?.countryLabel.text = self?.movie?.Country
                self?.genreLabel.text = self?.movie?.Genre
                self?.directorLabel.text = self?.movie?.Director
                self?.runtimeLabel.text = self?.movie?.Runtime
                self!.posterIV.image = UIImage(named: "image-placeholder")
                self?.posterIV.loadFrom(url: self!.movie!.Poster)
            }
        })
        // Do any additional setup after loading the view.
    }

}
