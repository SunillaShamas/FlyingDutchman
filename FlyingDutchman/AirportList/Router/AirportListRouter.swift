//
//  FlyingListRouter.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum AirportListRouter: Routable {

    case fetchFlyingList

    // perhaps can be moved to info.plist
    var baseURL: String {
        return "api.qantas.com"
    }

    var path: String {
        return "/flight/refData/airport"
    }
}
