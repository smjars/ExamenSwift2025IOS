//
//  Movie.swift
//  examenswift
//
//  Created by Tardes on 27/1/25.
//

import Foundation

struct MovieResponse: Decodable {
    
    let Response : String
    let Search : [Movie]
}

struct Movie: Decodable{
    
    let Title : String
    let Year : String
    let Poster : String
    let imdbID : String
    let Plot : String?
    let Runtime : String?
    let Director: String?
    let Genre: String?
    let Country: String?
}
