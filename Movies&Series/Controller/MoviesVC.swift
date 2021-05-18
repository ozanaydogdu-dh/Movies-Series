//
//  MoviesVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit

class MoviesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movies]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "moviescell")
        fetchData()
     
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
 
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = Bundle.main.loadNibNamed("MoviesCell", owner: self, options: nil)?.first as! MoviesCell
            cell.movieNameLabel.text = "Deneme"
        return cell
        }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     performSegue(withIdentifier: "toDetailsVC", sender: nil)

    }

    
    func fetchData() {

                URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/550?api_key=90902ac3c64dc9e1f3647be926a89054")!,
                                       completionHandler: { data, response, error in
                                        
                                        guard let data = data, error == nil else {
                                            return
                                        }
                                        // Convert
                                        var result: MoviesDataModel?
                                        do {
                                            result = try JSONDecoder().decode(MoviesDataModel.self, from: data)
                                        }
                                        catch {
                                            print("error")
                                        }
                                        
                                        guard let finalResult = result else {
                                            return
                                        }
                                        // Update our movies array
                                        let newMovies = finalResult.results
                                        self.movies.append(contentsOf: newMovies)
                                        
                                        // Refresh our table
                                        DispatchQueue.main.async {
                                            self.tableView.reloadData()
                                        }
                                        
                                       }).resume()
            }
        


}
        



