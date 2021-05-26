//
//  MoviesVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit
import Kingfisher

class MoviesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [Result]()
    var genre = [Genre] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "moviescell")
        getGenre()
    }
    
    func getMovies(){
        
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
    
    func getGenre(){
        
        let url = URL(string:"https://api.themoviedb.org/3/genre/movie/list?api_key=90902ac3c64dc9e1f3647be926a89054")!
        
        Service().downloadGenre(url: url) { (genreListesi) in
            self.getMovies()
            if let genreListesi = genreListesi{
                self.genre = genreListesi.genres
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
extension MoviesVC:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MoviesCell", owner: self, options: nil)?.first as! MoviesCell
        var genreListe = ""
        
        for id in movies[indexPath.row].genreIDS!{
            genreListe.append("\(genre.first(where: {$0.id == id})!.name), ")
            
        }
        genreListe.removeLast(2)
        cell.genreLabel.text = genreListe
        cell.customize(with: movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = Storyboard.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
        
        destinationVC.movie = movies[indexPath.row]
        
        var genreListe = ""
        
        for id in movies[indexPath.row].genreIDS!{
            genreListe.append("\(genre.first(where: {$0.id == id})!.name), ")}
        genreListe.removeLast(2)
        destinationVC.getGenreListe = genreListe
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
