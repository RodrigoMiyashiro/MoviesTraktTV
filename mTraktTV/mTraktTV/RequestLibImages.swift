//
//  RequestLibImages.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class RequestLibWithImgs: NSObject
{
    static func getImages(withImdb imdb: String,completion: @escaping(Any?) -> Void)
    {
        let url = Url.baseFanart.rawValue +
            URLComplement.movies.rawValue +
            imdb +
            URLComplement.apiKey.rawValue +
            APIKey.fanart.rawValue
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                completion(JSON(data))
            }
            if let error = result as? Error
            {
                completion(error)
            }
        }
    }
}
