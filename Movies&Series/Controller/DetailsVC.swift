//
//  DetailsVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 21.05.2021.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")

        
    }
    

}
extension DetailsVC: UITableViewDataSource, UITableViewDelegate {
  
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DetailsTableViewCell", owner: self, options: nil)?.first as! DetailsTableViewCell
        return cell
    }
    
    
    
    
}
