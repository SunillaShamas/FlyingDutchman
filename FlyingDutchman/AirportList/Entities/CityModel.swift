//
//  CityModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

// MARK: - City
struct CityModel: Decodable {
    let cityCode, cityName, timeZoneName: String?
}
