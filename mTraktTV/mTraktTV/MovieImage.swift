//
//  MovieImage.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieImage: NSObject
{
    var name: String
    var tmdbID: String
    var imdbID: String
    var imgPoster: [ImagePoster]
    var imgThumb: [ImageThumb]
    var imgBackground: [ImageBackground]
    
    override init()
    {
        name = ""
        tmdbID = ""
        imdbID = ""
        imgPoster = [ImagePoster]()
        imgThumb = [ImageThumb]()
        imgBackground = [ImageBackground]()
    }
    
    init(name: String, tmdbID: String, imdbID: String, imgPoster: [ImagePoster], imgThumb: [ImageThumb], imgBackground: [ImageBackground])
    {
        self.name = name
        self.tmdbID = tmdbID
        self.imdbID = imdbID
        self.imgPoster = imgPoster
        self.imgThumb = imgThumb
        self.imgBackground = imgBackground
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        self.name = dataJSON["name"].stringValue
        self.tmdbID = dataJSON["tmdb_id"].stringValue
        self.imdbID = dataJSON["imdb_id"].stringValue
        self.imgPoster = ArrayImagePoster.images(with: dataJSON["movieposter"].arrayValue) //arrayImg(array: dataJSON["movieposter"].arrayValue) as! [ImagePoster]
        self.imgThumb = ArrayImageThumb.images(with: dataJSON["moviethumb"].arrayValue) //arrayImg(array: dataJSON["moviethumb"].arrayValue) as! [ImageThumb]
        self.imgBackground = ArrayImageBackground.images(with: dataJSON["moviebackground"].arrayValue) //arrayImg(array: dataJSON["moviebackground"].arrayValue) as! [ImageBackground]
    }
    
    private func arrayImg(array: [JSON]) -> [ImageElement]
    {
        var arrayImgs = [ImageElement]()
        for img in array
        {
            let newImg = ImageElement(dataJSON: img)
            arrayImgs.append(newImg)
        }
        
        return arrayImgs
    }
}
