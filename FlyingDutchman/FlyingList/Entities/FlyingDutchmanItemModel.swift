//
//  FlyingDutchmanItemModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

struct FlyingDutchmanItemModel: Decodable {
    var airportCode: String
    var internationalAirport: Bool
    var domesticAirport: Bool
    var regionalAirport:  Bool
    var onlineIndicator: Bool
    var eticketableAirport: Bool
}
