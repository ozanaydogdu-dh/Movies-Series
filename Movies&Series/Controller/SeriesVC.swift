//
//  SeriesVC.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 11.05.2021.
//

import UIKit

class SeriesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var series = [ResultSeries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SeriesCell", bundle: nil), forCellWithReuseIdentifier: "seriesCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        
        
        
        let urlSeries = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=90902ac3c64dc9e1f3647be926a89054")!
        
        Service().downloadSeries(url: urlSeries) { (diziListesi) in
            if let diziListesi = diziListesi{
                self.series = diziListesi.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seriesCell", for: indexPath) as! SeriesCell
        cell.seriesNameLabel.text = series[indexPath.row].name
        cell.ratingLabel.text = String(series[indexPath.row].voteAverage)
        
        
        
        let urlstr = "https://image.tmdb.org/t/p/w500" + (series[indexPath.row].posterPath ?? "")
        cell.seriesImage.kf.setImage(with:URL(string: urlstr))
        
        
        
        
        return cell
        
        
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailSeriesVC", sender: nil)
    }
    
    
   
    
    
    
    
    
    
}




