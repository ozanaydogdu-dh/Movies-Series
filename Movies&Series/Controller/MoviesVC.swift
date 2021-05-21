//
//  MoviesVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit
import Alamofire
import Kingfisher

class MoviesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "moviescell")
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/popular?api_key=90902ac3c64dc9e1f3647be926a89054")!
        
        Service().downloadMovie(url: url) { (filmListesi) in
            if let filmListesi = filmListesi{
                self.movies = filmListesi.results!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MoviesCell", owner: self, options: nil)?.first as! MoviesCell
        cell.movieNameLabel.text = movies[indexPath.row].title
        cell.ratingLabel.text = String(movies[indexPath.row].voteAverage!)
        cell.releaseDateLabel.text = String(movies[indexPath.row].releaseDate!)
        
        let urlstr = "https://image.tmdb.org/t/p/w500" + (movies[indexPath.row].posterPath ?? "")
        cell.movieImage.kf.setImage(with:URL(string: urlstr))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    
    
    
    
    
}




