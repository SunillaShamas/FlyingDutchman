//
//  LocationModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

// MARK: - Location
struct LocationModel: Decodable {
    let aboveSeaLevel: Int?
    let latitude, latitudeRadius, longitude, longitudeRadius: Double
    let latitudeDirection: String?
    let longitudeDirection: String?
}
