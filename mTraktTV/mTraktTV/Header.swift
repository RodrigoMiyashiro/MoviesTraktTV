//
//  Header.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import Alamofire

class Header: NSObject
{
    static func headerToRequest() -> HTTPHeaders
    {
        return ["Content-Type" : "application/json",
                "trakt-api-version": "2",
                "trakt-api-key" : "5cc0df48ea07aaa96e15d8152cb9911b253391138cdd4e777cd6ee1aa6188d0a"]
    }
}
