//
//  DetailsTableViewCell.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 21.05.2021.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
