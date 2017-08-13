//
//  IdsMovie.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class IdsMovie: NSObject
{
    var trakt: Int
    var slug: String
    var imdb: String
    var tmdb: Int
    
    override init()
    {
        trakt = 0
        slug = ""
        imdb = ""
        tmdb = 0
    }
    
    required init(trakt: Int, slug: String, imdb: String, tmdb: Int)
    {
        self.trakt = trakt
        self.slug = slug
        self.imdb = imdb
        self.tmdb = tmdb
    }
    
    convenience required init(dataJSON: JSON)
    {
        self.init()
        self.trakt = dataJSON["trakt"].intValue
        self.slug = dataJSON["slug"].stringValue
        self.imdb = dataJSON["imdb"].stringValue
        self.tmdb = dataJSON["tmdb"].intValue
    }
}
