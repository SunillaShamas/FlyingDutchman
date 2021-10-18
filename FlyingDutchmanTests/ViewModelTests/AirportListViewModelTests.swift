//
//  AirportListViewModelTests.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import XCTest
@testable import FlyingDutchman

class AirportListViewModelTests: XCTestCase {

    var viewModel : AirportListViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = AirportListViewModel(apiService: MockAirportListService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testViewDidLoad() {
        let loadExpectation = XCTestExpectation(description: "Loaded")
        viewModel?.viewStateDidUpdate = { state in
            switch state {
            case .loaded:
                loadExpectation.fulfill()
            default:
                break
            }
        }
        viewModel?.viewDidLoad()

        wait(for: [loadExpectation], timeout: 1.0)
    }

    func testViewDidRetry() {
        let loadExpectation = XCTestExpectation(description: "Loaded")
        viewModel?.viewStateDidUpdate = { state in
            switch state {
            case .loaded:
                loadExpectation.fulfill()
            default:
                break
            }
        }
        viewModel?.viewDidRetry()

        wait(for: [loadExpectation], timeout: 1.0)
    }

    func testAirportCount() {
        XCTAssertEqual(viewModel?.airportCount, 0)
        viewModel?.viewDidLoad()
        XCTAssertEqual(viewModel?.airportCount, 2)
    }

    func testModelForIndex() {
        viewModel?.viewDidLoad()
        let model = viewModel?.modelFor(index: 0)
        XCTAssertNotNil(model)
        XCTAssertEqual(model?.airportName, "Bahia Pinas")
        XCTAssertEqual(model?.country.countryName, "Panama")
    }

    func testViewModelForIndex() {
        viewModel?.viewDidLoad()
        let model = viewModel?.viewModelForDetail(at: 0)
        XCTAssertNotNil(model)
    }

}
