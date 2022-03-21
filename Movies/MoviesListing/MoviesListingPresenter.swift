//
//  MoviesListingPresenter.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

class MoviesListingPresenter : MoviesListingPresenterProtocol, MoviesListingInteractorOutputProtocol {
    
    
    weak private var view: MoviesListingViewProtocol?
    var interactor: MoviesListingInteractorInputProtocol?
    private let router: MoviesListingWireframeProtocol
    
    var result: Results?
    var page: Int = 0
    

    init(interface : MoviesListingViewProtocol, interactor : MoviesListingInteractorInputProtocol?, router : MoviesListingWireframeProtocol) {
        self.view = interface
        self.router = router
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        self.page = 0
    }
    
    func startFetchingMovies(page: Int) {
        self.page = page
        self.view?.showLoader()
        self.interactor?.fetchMovies(page: page)

    }
    
    func showMoviesDetail(indexPath: IndexPath) {
        guard let movie = self.result?.results? [indexPath.row] else { return }
        self.router.showMoviesDetails(movie: movie)
    }
    
    func fetchMovies(result: Results) {
        self.result = result
        self.view?.hideLoader()
        self.view?.refreshView()
    }
    
    func showError(error: Error) {
        self.view?.showError(error: error)

    }
    
    
}
