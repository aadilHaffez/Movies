//
//  MockNewsListingViewController.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
@testable import Movies

class MockMoviesListingViewController {
    var presenter: MoviesListingPresenterProtocol?

}

extension MockMoviesListingViewController : MoviesListingViewProtocol {
    func showLoader() {
        ///
    }
    
    func hideLoader() {
        ///
    }
    
    func refreshView() {
        ///
    }
    
    func showError(error: Error) {
        ///
    }
}
