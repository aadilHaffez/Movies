//
//  MoviesListingRouter.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
import UIKit

class MoviesListingRouter : MoviesListingWireframeProtocol {
    
    
    var viewController : UIViewController?
    var navigationController : UINavigationController?
    
    static func createModule(using navigationController : UINavigationController) -> UIViewController{
        let view = MoviesListingViewController.initFromStoryboard(name: "Movies")
        let interactor = MoviesListingInteractor()
        let router = MoviesListingRouter()
        let presenter = MoviesListingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.navigationController = navigationController
        
        return view
    }
    
    func showMoviesDetails(movie: Movie) {
        let controller = MoviesDetailsRouter.createModule(movies: movie)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
