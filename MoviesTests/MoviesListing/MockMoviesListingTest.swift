//
//  MockMoviesListingTest.swift
//  MoviesTests
//
//  Created by aadil khaskheli on 22/03/2022.
//

import XCTest
@testable import Movies

class MockMoviesListingTest: XCTestCase {
    
    var interface =  MockMoviesListingViewController()
       var router = MockMoviesListingRouter()
       var interactor = MockMoviesListingInteractor()
       var presenter : MoviesListingPresenter?
    
    override func setUp() {
        presenter = MoviesListingPresenter.init(interface: interface, interactor: interactor, router: router)
       
        interactor.presenter = presenter
        interface.presenter = presenter
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJSONManager(){
        let manager = JSONManager.getMoviesData()
        switch manager {
        case .Success(let data):
            XCTAssertNotNil(data)
            break
        case .Failure( _):
            XCTFail()
            break
        }
    
        
    }
    func testMoviesCountShouldBeGreaterThanZero() {
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
        guard let result = presenter?.result else {
            XCTFail("Calassified are nil")
            return}
        guard let results = result.results else { fatalError("Movies are nil") }
        let count = results.count
        XCTAssert(count > 0, "Count is zero")
    }
    
    func testAllMoviesItemsHasName() {
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
        guard let result = presenter?.result else { fatalError("Movies are nil") }
        guard let results = result.results else { fatalError("Movies are nil") }
        for value in results {
            guard let name = value.title else { fatalError("Title is nil") }
            XCTAssert(name.count > 0, "Name is empty")
        }
    }
    
    func testAllMoviesItemsHasOverview() {
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
        guard let result = presenter?.result else { fatalError("Movies are nil") }
        guard let results = result.results else { fatalError("Movies are nil") }
        for value in results {
            guard let abstract = value.overview else { fatalError("overview is nil") }
            XCTAssert(abstract.count > 0, "overview is empty")
        }
    }
    
    func testAllMoviesItemsHasReleasedDate() {
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
        guard let result = presenter?.result else { fatalError("Movies are nil") }
        guard let results = result.results else { fatalError("Movies are nil") }
        for value in results {
            guard let publishedDate = value.release_date else { fatalError("released date is nil") }
            XCTAssert(publishedDate.count > 0, "release Date is empty")
        }
    }

    func testFetchDataShouldFail(){
        NetworkManager.shared.isInternetConnected = false
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
    }
    
    func testShouldShowAPIError(){
        presenter?.viewDidLoad()
        presenter?.startFetchingMovies(page: 1)
    }
}
