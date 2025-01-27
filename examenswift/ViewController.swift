//
//  ViewController.swift
//  examenswift
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource,
                      UISearchBarDelegate {
    
    var movieList: [Movie] = []
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = movieList[indexPath.row]
        
        let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        
        cell.render(movie: item)
        //cell.titleLabel.text = item.name
        //cell.subtitleLabel.text = item.dates
        //cell.signImageView.image = item.image
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        viewController.movie = movieList[tableView.indexPathForSelectedRow!.row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        MovieProvider.searchByName(query: "Goku", completionHandler: { [weak self] results in
            self?.movieList = results
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        MovieProvider.searchByName(query: searchBar.text!, completionHandler: { [weak self] results in
            self?.movieList = results
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
            }
        }
                                   
        )}}
