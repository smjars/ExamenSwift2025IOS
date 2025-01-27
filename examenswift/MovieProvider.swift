//
//  MovieProvider.swift
//  examenswift
//
//  Created by Tardes on 27/1/25.
//

import Foundation


class MovieProvider{
    
    static func searchByName(query:String, completionHandler: @escaping ([Movie]) -> Void){
        
        let url = URL(string: "http://www.omdbapi.com/?apikey=63c4077e&s=\(query)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error fetching movies: \(error)")
                return
            }
            guard let data = data else {
                print("Error with the data")
                return
            }
            
            print("Data: \(data)")
            
            guard let json = try? JSONDecoder().decode(MovieResponse.self, from: data) else{
                print("Json parse exception")
                return
                }
            
            completionHandler(json.Search)
        })
        
        task.resume()
        
    }
    static func searchById(query:String, completionHandler: @escaping (Movie) -> Void){
        
        let url = URL(string: "http://www.omdbapi.com/?apikey=63c4077e&i=\(query)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error fetching movies: \(error)")
                return
            }
            guard let data = data else {
                print("Error with the data")
                return
            }
            
            print("Data: \(data)")
            
            guard let json = try? JSONDecoder().decode(Movie.self, from: data) else{
                print("Json parse exception")
                return
                }
            
            completionHandler(json)
        })
        
        task.resume()
        
    }
   
}
