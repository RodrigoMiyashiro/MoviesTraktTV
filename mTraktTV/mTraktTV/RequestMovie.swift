//
//  RequestMovie.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class RequestMovie: NSObject
{
    static func getMovies(completion: @escaping(Any?) -> Void)
    {
        let url = Url.baseTrakt.rawValue + URLComplement.movies.rawValue + URLComplement.popular.rawValue
        
        Request.getFrom(url, nil, Header.headerToRequest()) { (result) in
            if let data = result as? Data
            {
                completion(JSON(data).arrayValue)
            }
            
            if let error = result as? Error
            {
                completion(error)
            }
        }
    }
}
