//
//  MoveiDetailViewController.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 14/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class MoveiDetailViewController: UIViewController
{
    
    // MARK: - Lets and Vars
    var slug = ""
    internal var fullMovie = MovieDetailViewModel()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var lblTagline: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setMovieDetail()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    
    func setMovieDetail()
    {
        Spinner.show(view: self.view)
        fullMovie.loadMovieList(slug: slug) { 
            self.lblTitle.text = self.fullMovie.movie.title
            self.lblReleaseDate.text = String.convertDate(dateStr: self.fullMovie.movie.released)
            self.lblRuntime.text = String(self.fullMovie.movie.runtime) + " min"
            self.lblTagline.text = self.fullMovie.movie.tagline
            self.lblOverview.text = self.fullMovie.movie.overview
            self.lblRating.text = String(format: "%.2f", self.fullMovie.movie.rating)
            self.lblGenres.text = String(describing: self.fullMovie.movie.genre.name).replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            self.pageControl.numberOfPages = self.fullMovie.movie.images.imgThumb.count
            
            self.bannerCollectionView.reloadData()
            Spinner.stopAnimating()
        }
    }
}


// MARK: - Extension CollectionView DataSource
extension MoveiDetailViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return fullMovie.movie.images.imgThumb.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let Cellidentifier = "bannerCollectionCell"
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: Cellidentifier, for: indexPath) as! BannerCollectionViewCell
        let row = indexPath.row
        
        cell.imageBanner.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        cell.imageBanner.sd_addActivityIndicator()
        cell.imageBanner.sd_setImage(with: URL(string: fullMovie.movie.images.imgThumb[row].url), placeholderImage: UIImage(named: "img_placeholder"))

        
        return cell
    }
}

extension MoveiDetailViewController: UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let pageWidth:CGFloat = bannerCollectionView.frame.width
        let contentOffset:CGFloat = bannerCollectionView.contentOffset.x
        let currentPage:CGFloat = floor((contentOffset - pageWidth / 2) / pageWidth) + 1
        
        pageControl.currentPage = Int(currentPage);
    }
}
