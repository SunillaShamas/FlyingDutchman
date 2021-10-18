//
//  DependencyProvider.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import Foundation

protocol DependencyProviding {
    static func getService() -> APIService
    static func getViewModel() -> AirportViewing
}


struct AirportListDependencyProvider: DependencyProviding {
    static func getService() -> APIService {
        AirportService()
    }

    static func getViewModel() -> AirportViewing {
        AirportListViewModel(apiService: getService())
    }
}
