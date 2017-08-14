//
//  ArrayImagePoster.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArrayImagePoster
{
    static func images(with array: [JSON]) -> [ImagePoster]
    {
        var arrayImgs = [ImagePoster]()
        for img in array
        {
            let newImg = ImagePoster(dataJSON: img)
            arrayImgs.append(newImg)
        }
        
        return arrayImgs
    }
}

class ArrayImageThumb
{
    static func images(with array: [JSON]) -> [ImageThumb]
    {
        var arrayImgs = [ImageThumb]()
        for img in array
        {
            let newImg = ImageThumb(dataJSON: img)
            arrayImgs.append(newImg)
        }
        
        return arrayImgs
    }
}

class ArrayImageBackground
{
    static func images(with array: [JSON]) -> [ImageBackground]
    {
        var arrayImgs = [ImageBackground]()
        for img in array
        {
            let newImg = ImageBackground(dataJSON: img)
            arrayImgs.append(newImg)
        }
        
        return arrayImgs
    }
}
