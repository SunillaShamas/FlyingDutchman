//
//  LocalExtensionTests.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import XCTest
@testable import FlyingDutchman

class LocaleExtensionTests: XCTestCase {

    func testCurrencyCodeFound() {
        let formattedCurrencyCode = Locale.formattedCurrency(countryCode: "AU")
        XCTAssertEqual(formattedCurrencyCode, "AUD - Australian Dollar")
    }

    func testCurrencyCodeNotFound() {
        let formattedCurrencyCode = Locale.formattedCurrency(countryCode: "AUU")
        XCTAssertEqual(formattedCurrencyCode, " - ")
    }


}
