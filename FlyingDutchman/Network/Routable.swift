//
//  Routable.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

/// scheme enum for Routable
enum RoutableScheme: String {
    case https
    case http
}

/// Routable conversion error
enum RouteError: Error {
    case invalidRoute
}

enum HTTPType : String {
    case GET
    case POST
    case PUT
    case DELETE
}


/// Routable protocol which defines the requirements to determine the request
protocol Routable {

    var methodType: HTTPType { get }
    var scheme: RoutableScheme { get }
    var baseURL: String { get }
    var path: String { get }

    var queryItems: [URLQueryItem] { get }
    var headers: [String : Any] { get }

    func asURLRequest() throws -> URLRequest
}

extension Routable {
    var methodType: HTTPType {
        return .GET
    }

    var scheme: RoutableScheme {
        return .https
    }

    var queryItems: [URLQueryItem] {
        return []
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
