//
//  MoviesDetailsPresenter.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

class MoviesDetailsPresenter : MoviesDetailsPresenterProtocol, MoviesDetailsInteractorOutputProtocol {
    
    
    weak private var view: MoviesDetailsViewProtocol?
    var interactor: MoviesDetailsInteractorInputProtocol?
    private let router: MoviesDetailsWireframeProtocol
    
    var movies: Movie?
    
    
    init(interface: MoviesDetailsViewProtocol, interactor: MoviesDetailsInteractorInputProtocol?, router: MoviesDetailsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad() {
        guard let movies = movies,
            let title = movies.title,
            let description = movies.overview,
            let date = movies.release_date else {
                //ShowError
                return
        }
        
        self.view?.setNavigationTitle(title: title)
        self.view?.setupMovies(title: title, description: description, date: date)
        
        //Check count to avoid crash - index out of bound
        if let media = movies.poster_path {
            self.view?.loadImage(url: "https://image.tmdb.org/t/p/original\(media)")
        }
    }
    
    
    
    
}
