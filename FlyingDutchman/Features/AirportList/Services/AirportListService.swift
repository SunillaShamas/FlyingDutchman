//
//  AirportListService.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

class AirportService: APIService {
    let session = URLSession.shared

    func fetch(urlRequest: Routable, completionHandler: @escaping (Result<AirportListModel, ServiceError>) -> Void) {

        do {
            let task = try session.dataTask(with: urlRequest.asURLRequest(), completionHandler: { (dataResponse, responseObject, error) in

                guard let data = dataResponse else {
                    completionHandler(.failure(.checkNetworkMaybe))
                    return
                }

                do {
                    let response = try JSONDecoder().decode(AirportListModel.self, from: data)
                    completionHandler(.success(response))
                } catch {
                    // return parsing failed error
                    completionHandler(.failure(.invalidResponseStructure))
                }
            })
            task.resume()
        } catch {
            completionHandler(.failure(.invalidURL))
        }
    }
}
