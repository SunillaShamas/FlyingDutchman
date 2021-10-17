//
//  FlyingListRouter.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum AirportListRouter: Routable {

    case fetchFlyingList

    var methodType: HTTPType {
        return .GET
    }

    var scheme: RoutableScheme {
        return .https
    }

    // perhaps can be moved to info.plist
    var baseURL: String {
        return "api.qantas.com"
    }

    var path: String {
        return "/flight/refData/airport"
    }

    var queryItems: [URLQueryItem] {
        switch self{
        case .fetchFlyingList:
            return []
        }
    }

    var headers: [String : Any] {
        return [:]
    }


    /// Creates a URLRequest object using the implemented Routable protocol
    /// - Throws: RouteError
    /// - Returns: URLRequest
    func asURLRequest() throws -> URLRequest {

        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else{
            throw RouteError.invalidRoute
        }

        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue

        for headerField in headers.keys {
            request.setValue(headers[headerField] as? String, forHTTPHeaderField: headerField)
        }

        return request
    }
}
