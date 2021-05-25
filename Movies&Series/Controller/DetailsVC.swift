//
//  DetailsVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 21.05.2021.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var getName = ""
    var getRating = 0.0
    var getImage = ""
    var getDate = ""
    var getSummary = ""
    var getGenreListe = ""
    var movie : Result!{
        didSet{
            self.getName = movie.title ?? ""
            self.getRating = movie.voteAverage ?? 0.0
            self.getImage = movie.posterPath ?? ""
            self.getDate = movie.releaseDate ?? ""
            self.getSummary = movie.overview ?? ""
            
        }
        
    }
    var series : ResultSeries!{
        didSet{
            self.getName = series.name
            self.getRating = series.voteAverage
            self.getImage = series.posterPath
            self.getDate = series.firstAirDate
            self.getSummary = series.overview
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        tableView.register(UINib(nibName: "Details2Cell", bundle: nil), forCellReuseIdentifier: "Details2Cell")
        tableView.register(UINib(nibName: "Detail3Cell", bundle: nil), forCellReuseIdentifier: "Detail3Cell")
    }
}
extension DetailsVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row > 1 {
            let cell3 = Bundle.main.loadNibNamed("Detail3Cell", owner: self, options: nil)?.first as! Detail3Cell
            cell3.summaryLabel.text = getSummary
            return cell3
        }
    if indexPath.row > 0 {
        
       let cell2 = Bundle.main.loadNibNamed("Details2Cell", owner: self, options: nil)?.first as! Details2Cell
    
        cell2.nameLabel.text = getName
        cell2.ratingLabel.text = String(getRating)
        cell2.dateLbl.text = getDate
        cell2.genreLabel.text = getGenreListe
    
        return cell2
    }
   
        let cell = Bundle.main.loadNibNamed("DetailsTableViewCell", owner: self, options: nil)?.first as! DetailsTableViewCell
        
        let urlstr = "https://image.tmdb.org/t/p/w500\(getImage)"
        cell.detailImageView.kf.setImage(with:URL(string: urlstr))
    return cell
        
    }
    
  
    
    
}
