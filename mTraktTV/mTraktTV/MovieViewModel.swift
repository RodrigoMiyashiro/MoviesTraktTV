//
//  MovieViewModel.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieViewModel: NSObject
{
    private var movies: [Movie]
    
    override init()
    {
        movies = [Movie]()
    }
    
    func loadMovieList()
    {
        RequestMovie.getMovies { (result) in
            if let jsonArrayData = result as? [JSON]
            {
                for json in jsonArrayData
                {
                    let newMovie = Movie(dataJSON: json)
                    self.movies.append(newMovie)
                }
                
                print("--\n\(self.movies)\n")
            }
            
            if let error = result as? Error
            {
                print("-->> Error Get Popular Movies: \(error)")
            }
        }
    }
}
