//
//  MoviesListingInteracter.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

class MoviesListingInteractor : MoviesListingInteractorInputProtocol {
   weak var presenter: MoviesListingInteractorOutputProtocol?
    
    
    //API Session
    static let sharedWebClient = WebClient(baseURL: API_MOVIES_LIST)
    var loginTask: URLSessionDataTask!
    
    func fetchMovies(page: Int) {
        let parameters : [String : Any] = [
            "api_key": API_KEY]
        
        let url_string = "\(API_MOVIES_LIST)/3/discover/movie"
        let get_classified = URLRequest(page: page, url: url_string,
                                  method: URLRequest.HTTPMethod.get,
                                  body: parameters)
        
        loginTask = MoviesListingInteractor.sharedWebClient.dataTask(get_classified) {[weak self] response in
            DispatchQueue.main.async {
                guard let data = response.successResponse?.data else {
                    return
                }
                self?.parseMovies(data: data)
            }
        }
    }
    
    private func parseMovies(data: Data) {
            // parse the result as JSON, since that's what the API provides
        do{
            let result = try JSONDecoder().decode(Results.self, from: data)
            self.presenter?.fetchMovies(result: result)
        } catch (let error){
            presenter?.showError(error: error)
        }
    }
}
