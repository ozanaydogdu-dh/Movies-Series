//
//  MoviesCell.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit




class MoviesCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
        var genre = [Genre] ()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImage.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func customize(with item: Result){
        
        self.movieNameLabel.text = item.title
        self.releaseDateLabel.text = item.releaseDate
        self.ratingLabel.text = String(item.voteAverage!)
        self.layer.cornerRadius = 15
        let urlstr = "https://image.tmdb.org/t/p/w500" + (item.posterPath ?? "")
        self.movieImage.kf.setImage(with:URL(string: urlstr))
        
        //        var genreListe = ""
        //
        //        for id in item.genreIDS!{
        //
        //          genreListe.append("\(genre.first(where: {$0.id == id})!.name), ")}
        //        self.genreLabel.text = genreListe
    }
}


