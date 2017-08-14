//
//  Genre.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import  SwiftyJSON

class Genre: NSObject
{
    var name: [String]
    
    override init()
    {
        name = [String]()
    }
    
    init(name: [String])
    {
        self.name = name
    }
    
    init(dataJSON: JSON)
    {
        self.name = dataJSON.arrayObject as! [String]
    }
}
