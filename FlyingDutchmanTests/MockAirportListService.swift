//
//  MockAirportListService.swift
//  FlyingDutchmanTests
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import XCTest

@testable import FlyingDutchman

class MockAirportListService: APIService {

    var mockContentData: Data {
        return getData(name: "mockResponse")
    }

    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }

    func fetch(urlRequest: Routable, completionHandler: @escaping (Result<AirportListModel, ServiceError>) -> Void) {
        let data = mockContentData
        if let response = try? JSONDecoder().decode(AirportListModel.self, from: data) {
            completionHandler(.success(response))
        }
    }
}
