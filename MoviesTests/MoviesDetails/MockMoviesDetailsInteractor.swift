//
//  MockMoviesDetailsInteractor.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 22/03/2022.
//

import Foundation
@testable import Movies

class MockMoviesDetailsInteractor : MoviesDetailsInteractorInputProtocol {
    
    func setPresenter(_ presenter: MoviesDetailsInteractorOutputProtocol) {
        
    }
    
    func getPresenter() -> MoviesDetailsInteractorOutputProtocol {
        return self.presenter!
    }
        
    var description: String = ""
    
    var presenter: MoviesDetailsInteractorOutputProtocol?
    
    
}
