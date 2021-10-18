//
//  AirportListRouterTests.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import XCTest

@testable import FlyingDutchman

class AirportListRouterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAirportListRouter() {
        let routable = AirportListRouter.fetchFlyingList
        XCTAssertEqual(routable.baseURL, "api.qantas.com")
        XCTAssertEqual(routable.path, "/flight/refData/airport")
        XCTAssertEqual(routable.scheme, RoutableScheme.https)
        XCTAssertEqual(routable.methodType, HTTPType.GET)
    }

}
