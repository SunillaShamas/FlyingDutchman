//
//  AirportModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

// MARK: - AirportModel
struct AirportModel: Decodable {
    let location: LocationModel
    let airportName: String
    let city: CityModel
    let country: CountryModel
}
