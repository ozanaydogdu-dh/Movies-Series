//
//  DetailsVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit

class DetailsVC: UIViewController {
   
    
    var getName = String()
       var getReleaseDate = String()
       var getOverview = String()
       var getGenre = [Int]()
       var getThumb = String()
       var getRating = Float()
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
