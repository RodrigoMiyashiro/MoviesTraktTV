//
//  MovieFull.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

/*
 "tagline": "Witness the beginning of a happy ending",
 "overview": "Based upon Marvel Comics’ most unconventional anti-hero, DEADPOOL tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.",
 "released": "2016-02-12",
 "runtime": 108,
 "rating": 8.23517,
 "genres": [
 "action",
 "adventure",
 "comedy",
 "romance",
 "superhero"
 ],
*/
class MovieFull: Movie
{
    var tagline: String
    var overview: String
    var released: String
    var runtime: Int
    var rating: Double
    var genre: Genre
    
    override init()
    {
        tagline = ""
        overview = ""
        released = ""
        runtime = 0
        rating = 0
        genre = Genre()
        super.init()
    }
    
    override init(dataJSON: JSON)
    {
        self.tagline = dataJSON["tagline"].stringValue
        self.overview = dataJSON["overview"].stringValue
        self.released = dataJSON["released"].stringValue
        self.runtime = dataJSON["runtime"].intValue
        self.rating = dataJSON["rating"].doubleValue
        self.genre = Genre(dataJSON: dataJSON["genres"])
        super.init(dataJSON: dataJSON)
    }
}
