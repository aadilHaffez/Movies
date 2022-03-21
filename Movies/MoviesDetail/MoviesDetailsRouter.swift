//
//  MoviesDetailsRouter.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
import UIKit

class MoviesDetailsRouter : MoviesDetailsWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(movies: Movie?) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MoviesDetailsViewController.initFromStoryboard(name: "Movies")
        
        let interactor = MoviesDetailsInteractor()
        let router = MoviesDetailsRouter()
        let presenter = MoviesDetailsPresenter(interface: view, interactor: interactor , router: router)
        presenter.movies = movies
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
