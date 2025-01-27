//
//  MoviesTableViewCell.swift
//  examenswift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet var imageIV: UIImageView!
    @IBOutlet var yearTV: UILabel!
    @IBOutlet var titleTV: UILabel!
    
    func render (movie: Movie){
        titleTV.text = movie.Title
        yearTV.text = movie.Year
        imageIV.image = UIImage(named: "image-placeholder")
        imageIV.loadFrom(url: movie.Poster)
        
    }


}
