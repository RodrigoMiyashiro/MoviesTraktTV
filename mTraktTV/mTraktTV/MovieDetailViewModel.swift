//
//  MovieDetailViewModel.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieDetailViewModel: NSObject
{
    internal var movie: MovieFull
    
    override init()
    {
        movie = MovieFull()
        
    }
    
    func loadMovieList(slug: String, completion: @escaping() -> Void)
    {
        RequestMovie.getSpecificMovie(slug: slug) { (result) in
            if let jsonData = result as? JSON
            {
                self.movie = MovieFull(dataJSON: jsonData)
                self.getImg(withImdb: self.movie.ids.imdb, completion: { 
                    completion()
                })
            }
            if let error = result as? Error
            {
                print("-->> Error Get Full Movie: \(error)")
            }
            completion()
        }
    }
    
    private func getImg(withImdb imdb: String, completion: @escaping() -> Void)
    {
        RequestLibWithImgs.getImages(withImdb: imdb) { (result) in
            if let data = result as? JSON
            {
                self.movie.images = MovieImage(dataJSON: data)
            }
            if let error = result as? Error
            {
                print("-->> Error get Images: \(error)")
            }
            completion()
        }
    }
}
