//
//  ImageElement.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageElement: NSObject
{
    var id: String
    var url: String
    var lang: String
    var likes: String
    
    override init() {
        id = ""
        url = ""
        lang = ""
        likes = ""
    }
    
    init(id: String, url: String, lang: String, likes: String)
    {
        self.id = id
        self.url = url
        self.lang = lang
        self.likes = likes
    }
    
    init(dataJSON: JSON)
    {
        self.id = dataJSON["id"].stringValue
        self.url = dataJSON["url"].stringValue
        self.lang = dataJSON["lang"].stringValue
        self.likes = dataJSON["likes"].stringValue
    }
}
