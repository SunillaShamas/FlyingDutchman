//
//  LocalExtensionTests.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import XCTest
@testable import FlyingDutchman

class LocalExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountryCodeFound() {
        let formattedCurrencyCode = Locale.getFormattedCurrency(countryCode: "AU")
        XCTAssertEqual(formattedCurrencyCode, "AUD - Australian Dollar")
    }

    func testCountryCodeNotFound() {
        let formattedCurrencyCode = Locale.getFormattedCurrency(countryCode: "AUU")
        XCTAssertEqual(formattedCurrencyCode, " - ")
    }


}
