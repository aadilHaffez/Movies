//
//  MoviesListingViewController+TableView.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
import UIKit

extension MoviesListingViewController : UITableViewDelegate {
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  120.0
        //We can use this - if we want height dynamic, based on client requirement of view.
        //UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.showMoviesDetail(indexPath: indexPath)
    }
}

extension MoviesListingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.result?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as? MoviesTableViewCell else {fatalError()}
      
        newsCell.accessibilityIdentifier = "myCell_\(indexPath.row)"

        guard let news = self.presenter?.result?.results? [indexPath.row] else {fatalError()}
        newsCell.setupCell(news: news)
        return newsCell
    }
}

