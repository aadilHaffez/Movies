//
//  MockMoviesDetailsViewController.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 22/03/2022.
//

import XCTest
@testable import Movies

class MockMoviesDetailsViewController {
    var presenter: MoviesDetailsPresenterProtocol?
}

extension MockMoviesDetailsViewController : MoviesDetailsViewProtocol {
    
    func setNavigationTitle(title: String) {
        
    }
    
    func setupMovies(title: String, description: String, date : String) {
        
    }
    
    func loadImage(url: String) {
        
    }
    
    
}
