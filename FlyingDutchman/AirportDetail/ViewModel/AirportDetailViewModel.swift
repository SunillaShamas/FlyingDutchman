//
//  AirportDetailViewModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum AirportDetailSpecs: String, CaseIterable {
    case currency = "Currency"
    case timezone = "TimeZone"
    case location = "Location"
}

class AirportDetailViewModel {
    let detailModel: AirportModel
    lazy var specs : [String:String] = [:]

    init(detailModel: AirportModel) {
        self.detailModel = detailModel
    }

    private func setupSpecs() {
        for spec in AirportDetailSpecs.allCases {
            switch spec {
            case .currency:
                specs[spec.rawValue] = detailModel.country.countryCode
            case .location:
                specs[spec.rawValue] = "\(detailModel.location.longitude):\(detailModel.location.longitude)"
            case .timezone:
                specs[spec.rawValue] = "\(String(describing: detailModel.city.timeZoneName))"
            }
        }
    }

    func viewDidLoad() {
        setupSpecs()
    }
}
