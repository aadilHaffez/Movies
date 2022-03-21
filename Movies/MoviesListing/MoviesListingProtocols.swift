//
//  MoviesListingProtocols.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

//MARK: Wireframe -
protocol MoviesListingWireframeProtocol : AnyObject {
    func showMoviesDetails(movie: Movie)
}

//MARK: Presenter -
protocol MoviesListingPresenterProtocol: AnyObject {
    
    var interactor: MoviesListingInteractorInputProtocol? { get set }
    
    var result : Results? { set get }
    var page : Int { set get }
    func viewDidLoad()
    
    func startFetchingMovies(page : Int)
    func showMoviesDetail(indexPath: IndexPath)
}

//MARK: Interactor -
protocol MoviesListingInteractorOutputProtocol: AnyObject {
    
    /* Interactor -> Presenter */
    func fetchMovies(result: Results)
    
    func showError(error: Error)
}

protocol MoviesListingInteractorInputProtocol: AnyObject {
    
    var presenter: MoviesListingInteractorOutputProtocol?  { get set }
    
    /* Presenter -> Interactor */
    func fetchMovies(page: Int)
}

//MARK: View -
protocol MoviesListingViewProtocol: AnyObject {
    
    var presenter: MoviesListingPresenterProtocol?  { get set }
    
    /* Presenter -> ViewController */
    
    func showLoader()
    func hideLoader()
    func refreshView()
    func showError(error: Error)
}
