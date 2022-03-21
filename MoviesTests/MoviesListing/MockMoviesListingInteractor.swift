//
//  MockMoviesListingPresenter.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
@testable import Movies

class MockMoviesListingInteractor: MoviesListingInteractorInputProtocol {
    var presenter: MoviesListingInteractorOutputProtocol?
    
    func fetchMovies(page: Int) {
        let result = JSONManager.getMoviesData()
        switch result {
            
        case .Success(let data):
            do {
                let result = try JSONDecoder().decode(Results.self, from: data)
                self.presenter?.fetchMovies(result: result)
            }catch (let error){
                self.presenter?.showError(error: error)
            }
        case .Failure(let error):
            print(error.localizedDescription)
        }
    }
}
