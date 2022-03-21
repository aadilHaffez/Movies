//
//  MoviesDetailsTest.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 22/03/2022.
//

import XCTest

@testable import Movies

class MoviesDetailsTests : XCTestCase {
    var interface =  MockMoviesDetailsViewController()
       var router = MockMoviesDetailsRouter()
       var interactor = MockMoviesDetailsInteractor()
       var presenter : MoviesDetailsPresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        presenter = MoviesDetailsPresenter.init(interface: interface, interactor: interactor, router: router)
       
        interactor.presenter = presenter
        interface.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testNewsIsNotEqualToNil() {
        presenter?.viewDidLoad()
        presenter?.movies  = Movie(adult: false, backdrop_path: nil, genre_ids: nil, id: nil, original_language: nil, original_title: nil, overview: "", popularity: nil, poster_path: "", release_date: "", title: "", video: false, vote_average: nil, vote_count: nil)
        
        XCTAssert(presenter?.movies != nil, "movie Not Nil")
    }
    
    func testNewsTitleIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        presenter?.movies  = Movie(adult: false, backdrop_path: nil, genre_ids: nil, id: nil, original_language: nil, original_title: nil, overview: nil, popularity: nil, poster_path: nil, release_date: nil, title: "Movie title", video: nil, vote_average: nil, vote_count: nil)
        
        XCTAssert(presenter?.movies?.title != nil, "Title is Nil")
        XCTAssert(presenter?.movies?.title?.count ?? 0 > 0, "Title is empty")
        
    }
    
    func testNewsAbstractIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        presenter?.movies  =  Movie(adult: false, backdrop_path: nil, genre_ids: nil, id: nil, original_language: nil, original_title: nil, overview: "Overview", popularity: nil, poster_path: nil, release_date: nil, title: nil, video: nil, vote_average: nil, vote_count: nil)
        
        XCTAssert(presenter?.movies?.overview != nil, "overview is Nil")
        XCTAssert(presenter?.movies?.overview?.count ?? 0 > 0, "overview is empty")
        
    }
    
    
    func testNewsMediaIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        presenter?.movies = Movie(adult: false, backdrop_path: nil, genre_ids: nil, id: nil, original_language: nil, original_title: nil, overview: nil, popularity: nil, poster_path: "https:", release_date: nil, title: nil, video: nil, vote_average: nil, vote_count: nil)
        
        XCTAssert(presenter?.movies?.poster_path != nil, "Poster is Nil")
        XCTAssert(presenter?.movies?.poster_path?.count ?? 0 > 0, "POster is empty")
        
    }
}
