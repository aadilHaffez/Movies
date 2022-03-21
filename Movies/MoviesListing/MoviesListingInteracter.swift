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
        let get_news = URLRequest(page: page,
                                  url: url_string,
                                  method: URLRequest.HTTPMethod.get,
                                  body: parameters)
        
        loginTask = MoviesListingInteractor.sharedWebClient.dataTask(get_news) {[weak self] response in
            print("Response is \(response)")
            DispatchQueue.main.async {
                guard let data = response.successResponse?.data else {
                    print("Error: did not receive data")
                    return
                }
                
                self?.parseMovies(data: data)
            }
        }
    }
    
    private func parseMovies(data: Data) {
            // parse the result as JSON, since that's what the API provides
            do {
                guard let _ = try JSONSerialization.jsonObject(with: data,
                                                               options: []) as? [String: Any] else {
                                                                print("Could not get JSON from responseData as dictionary")
                                                                return
                }
                
                guard let result = try? JSONDecoder().decode(Results.self, from: data) else {
                    print("Failed")
                   // self.presenter?.error(error: Error)
                    return
                }
                
                self.presenter?.fetchMovies(result: result)
            }catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
}
