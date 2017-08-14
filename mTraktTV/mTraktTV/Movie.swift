//
//  Movie.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class Movie: NSObject
{
    var title: String
    var year: Int
    var ids: IdsMovie
    var images: MovieImage
    
    override init()
    {
        title = ""
        year = 0
        ids = IdsMovie()
        images = MovieImage()
    }
    
    init(title: String, year: Int, trakt: Int, slug: String, imdb: String, tmdb: Int)
    {
        self.title = title
        self.year = year
        self.ids = IdsMovie(trakt: trakt, slug: slug, imdb: imdb, tmdb: tmdb)
        self.images = MovieImage(name: "", tmdbID: "", imdbID: "", imgPoster: [ImagePoster](), imgThumb: [ImageThumb](), imgBackground: [ImageBackground]())
    }
    
    init(dataJSON: JSON)
    {
        self.title = dataJSON["title"].stringValue
        self.year = dataJSON["year"].intValue
        self.ids = IdsMovie(dataJSON: dataJSON["ids"])
        self.images = MovieImage()
    }
}
