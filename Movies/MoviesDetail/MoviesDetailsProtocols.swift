//
//  MoviesDetailsProtocols.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

//MARK: Wireframe -
protocol MoviesDetailsWireframeProtocol : AnyObject{
    
}

//MARK: Presenter -
protocol MoviesDetailsPresenterProtocol : AnyObject{
    var interactor : MoviesDetailsInteractorInputProtocol? {get set}
    var movies : Movie? {set get}
    func viewDidLoad()
}

//MARK: Interactor -
protocol MoviesDetailsInteractorOutputProtocol: AnyObject {
    
    /* Interactor -> Presenter */
}

protocol MoviesDetailsInteractorInputProtocol: AnyObject {
    
    var presenter: MoviesDetailsInteractorOutputProtocol?  { get set }
    
    /* Presenter -> Interactor */
}

//MARK: View -
protocol MoviesDetailsViewProtocol: AnyObject {
    
    var presenter: MoviesDetailsPresenterProtocol?  { get set }
    
    /* Presenter -> ViewController */
    
    
    
    func setNavigationTitle(title: String)
    
    func setupMovies(title: String, description: String, date : String)
    func loadImage(url: String)
}
