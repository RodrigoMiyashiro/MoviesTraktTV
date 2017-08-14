//
//  Enums.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

enum Url: String
{
    case baseTrakt = "https://api.trakt.tv/"
    case baseFanart = "http://webservice.fanart.tv/v3/"
}

enum URLComplement: String
{
    case movies = "movies/"
    case popular = "popular"
    case apiKey = "?api_key="
    case fullDescription = "?extended=full"
    case search = "search/movie?query="
}

enum APIKey: String
{
    case fanart = "f63aa8d6aff5f5a7d47e22c440890c25"
}
