//
//  AirportDetailViewModelTests.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import XCTest
@testable import FlyingDutchman

class AirportDetailViewModelTests: XCTestCase {

    var viewModel: AirportDetailViewModel!

    override func setUpWithError() throws {

        let mockData = MockAirportListService().mockContentData

        let decodedData = try? JSONDecoder().decode(AirportListModel.self, from: mockData)
        if let decodedData = decodedData {
            viewModel = AirportDetailViewModel(detailModel: decodedData[0])
        }
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testAirportDetailViewModel() {
        viewModel.viewDidLoad()
        XCTAssertEqual(viewModel.specificationFor(index: 0)?.0, "Currency")
        XCTAssertEqual(viewModel.specificationFor(index: 0)?.1, "PAB - Panamanian Balboa")
        XCTAssertEqual(viewModel.specificationFor(index: 1)?.0, "TimeZone")
        XCTAssertEqual(viewModel.specificationFor(index: 1)?.1, "America/Panama")
        XCTAssertEqual(viewModel.specificationFor(index: 2)?.0, "Location")
        XCTAssertEqual(viewModel.specificationFor(index: 2)?.1, "Lat: 7.35 Long: 78.1")
    }

    func testSpecsCount() {
        viewModel.viewDidLoad()
        XCTAssertEqual(viewModel.specificationsCount, 3)
    }

    func testSpecificationForIndex() {
        viewModel.viewDidLoad()
        let specification = viewModel.specificationFor(index: 0)
        XCTAssertNotNil(specification)

        let specificationNotFound = viewModel.specificationFor(index: 5)
        XCTAssertNil(specificationNotFound)
    }

    

}
