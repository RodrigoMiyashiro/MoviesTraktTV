//
//  ListMoviesTableViewCell.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class ListMoviesTableViewCell: UITableViewCell
{
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieYear: UILabel!
    
    
    var movie: Movie?
    {
        didSet
        {
            if let movie = movie
            {
                lblMovieName.text = movie.title
                lblMovieYear.text = String(movie.year)
                
                imgBanner.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
                imgBanner.sd_addActivityIndicator()
                self.getImg(withImdb: movie.ids.imdb, completion: { (result) in
                    if let imgMovie = result as? MovieImage
                    {
                        movie.images = imgMovie
                        if let urlImg = imgMovie.imgThumb.first?.url
                        {
                            self.imgBanner.sd_setImage(with: URL(string: urlImg), placeholderImage: UIImage(named: "img_placeholder"))
                        }
                    }
                    if let _ = result as? Error
                    {
                        self.imgBanner.sd_removeActivityIndicator()
                    }
                })
            }
        }
    }
    
    private func getImg(withImdb imdb: String, completion: @escaping(Any?) -> Void)
    {
        RequestLibWithImgs.getImages(withImdb: imdb) { (result) in
            if let data = result as? JSON
            {
                completion(MovieImage(dataJSON: data))
            }
            if let error = result as? Error
            {
                print("-->> Error get Images: \(error)")
                completion(error)
            }
        }
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    }

}
