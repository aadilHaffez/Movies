//
//  JSONManager.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

enum CustomError : LocalizedError {
    case error(message:String)
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}
enum MoviesResult {
    case Success(Data)
    case Failure(Error)
}
struct JSONManager {
    
    static func getMoviesData() -> MoviesResult {
        return readData(from: "Movies")
    }
    
    private static func readData(from file:String) -> MoviesResult {
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return .Success(data)
            } catch (let ex){
                return .Failure(ex)
            }
        }else{
            return .Failure(CustomError.error(message: "JSON file not found"))
        }
    }
}
