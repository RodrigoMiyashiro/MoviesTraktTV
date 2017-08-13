//
//  ImageThumb.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageThumb: ImageElement
{
    override init()
    {
        super.init()
    }
    
    override init(id: String, url: String, lang: String, likes: String)
    {
        super.init(id: id, url: url, lang: lang, likes: likes)
    }
    
    override init(dataJSON: JSON)
    {
        super.init(dataJSON: dataJSON)
    }
}
