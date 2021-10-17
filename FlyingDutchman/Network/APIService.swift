//
//  APIService.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum ServiceError: Error {
    // url creation failed
    case invalidURL
    // no network error
    case checkNetworkMaybe
    // parse error
    case invalidResponseStructure
}

protocol APIService {

    /// Fetches data and returns it using the callback completion handler
    /// - Parameters:
    ///   - urlRequest: url Routable object which is used to create the urlRequest
    ///   - completionHandler: Completion Handler which contains the result enum
    ///    with success containing Products and error containg service error
    func fetch(urlRequest: Routable, completionHandler: @escaping (Result<AirportListModel, ServiceError>) -> Void)
}
