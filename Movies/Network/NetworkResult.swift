//
//  NetworkResult.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

struct NetworkResult<T> {
    let successResponse: T?
    let failureResponse: Error?
    
    init(success: T) {
        successResponse = success
        failureResponse = nil
    }
    
    init(failure: Error) {
        successResponse = nil
        failureResponse = failure
    }
}
