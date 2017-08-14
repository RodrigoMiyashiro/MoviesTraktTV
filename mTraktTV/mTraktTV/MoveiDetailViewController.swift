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

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MoveiDetailViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let Cellidentifier = "bannerCollectionCell"
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: Cellidentifier, for: indexPath) as! BannerCollectionViewCell
        
        
        return cell
    }
}
