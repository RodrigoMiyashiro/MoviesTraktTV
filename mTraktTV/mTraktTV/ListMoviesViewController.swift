//
//  ListMoviesViewController.swift
//  mTraktTV
//
//  Created by Rodrigo A E Miyashiro on 13/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController
{
    // MARK: - Lets and Vars
    internal var listMovies = MovieViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var listMovieTableView: UITableView!
    
    

    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        configTableView()
        listMovies.loadMovieList { 
            self.listMovieTableView.reloadData()
        }
    }
    
    private func configTableView()
    {
        listMovieTableView.estimatedRowHeight = 268
        listMovieTableView.rowHeight = UITableViewAutomaticDimension
        listMovieTableView.tableFooterView = UIView()
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

// MARK: - Extension to TableView DataSource
extension ListMoviesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listMovies.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let Cellidentifier = "listMovieCell"
        let cell = listMovieTableView.dequeueReusableCell(withIdentifier: Cellidentifier, for: indexPath) as! ListMoviesTableViewCell
        
        let row = indexPath.row
        let movie = listMovies.movies[row]
        
        cell.movie = movie
        
        return cell
    }
}
