//
//  WebClient.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

typealias URLResponse = NetworkResult<(data: Data, response: HTTPURLResponse)>

open class WebClient {
    private var baseURL : String
    
    public init(baseURL : String){
        
        self.baseURL = baseURL
    }
    
    func dataTask(_ request: URLRequest,
                  completionHandler: @escaping (URLResponse) -> Void) -> URLSessionDataTask {
        print("Request is \(request)")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let response = response as? HTTPURLResponse {
                    completionHandler(URLResponse(success: (data, response)))
                }
                else {
                    completionHandler(URLResponse(failure: error ?? NSError.init(domain: "com.movies",
                                                                                      code: 9999,
                                                                                      userInfo: [:])))
                }
            }
            task.resume()
            return task
    }
    
    
    
}

