//
//  MovieTests.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import mTraktTV

class MovieTests: XCTestCase
{
    
    let movieSimple = Movie()
    
//    let json: JSON = [ "title": "Deadpool", "year": 2016, "ids": [ "trakt": 190430, "slug": "deadpool-2016", "imdb": "tt1431045", "tmdb": 293660]]
//    let movieWithDataJSON = Movie(dataJSON: json)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMovieSimple()
    {
        XCTAssertTrue(movieSimple.ids.trakt == 0)
    }
    
    func testMovieWithData()
    {
        
    }
    
}
