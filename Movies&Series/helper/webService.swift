//
//  webService.swift
//  Movies&Series
//
//  Created by ozan aydogdu on 18.05.2021.
//

import Foundation

class Service  {
    
    func downloadMovie(url : URL, completion: @escaping (MoviesDataModel?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                do {
                    let movieList = try JSONDecoder().decode(MoviesDataModel.self, from:data)
                    completion(movieList)
                } catch let err {
                    print(err)
                }
            }
        }.resume()
    }
    
    func downloadSeries(url : URL, completion: @escaping (SeriesDataModel?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                do {
                    let seriesList = try JSONDecoder().decode(SeriesDataModel.self, from:data)
                    completion(seriesList)
                } catch let err {
                    print(err)
                }
            }
        }.resume()
    }
    
    func downloadGenre(url : URL, completion: @escaping (GenreMoviesModel?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                do {
                    let genreList = try JSONDecoder().decode(GenreMoviesModel.self, from:data)
                    completion(genreList)
                } catch let err {
                    print(err)
                    
                }
            }
        }.resume()
    }
}
