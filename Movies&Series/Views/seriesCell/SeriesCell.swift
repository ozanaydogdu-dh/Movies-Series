//
//  SeriesCell.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit

class SeriesCell: UICollectionViewCell {
    
    @IBOutlet weak var seriesImage: UIImageView!
    @IBOutlet weak var seriesNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       seriesImage.layer.cornerRadius = 15
      
    }
    
    func customizeSeries(with itemSeries:ResultSeries){
        self.layer.cornerRadius = 15
        self.seriesNameLabel.text = itemSeries.name
        self.ratingLabel.text = String(itemSeries.voteAverage)
        let urlstr = "https://image.tmdb.org/t/p/w500" + (itemSeries.posterPath )
        self.seriesImage.kf.setImage(with:URL(string: urlstr))
    }
}
