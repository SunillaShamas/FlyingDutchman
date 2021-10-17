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
    lazy var specs : [(String,String)] = []

    init(detailModel: AirportModel) {
        self.detailModel = detailModel
    }

    private func setupSpecs() {
        for spec in AirportDetailSpecs.allCases {
            switch spec {
            case .currency:
                specs.append( (spec.rawValue, Locale.getFormattedCurrency(countryCode: detailModel.country.countryCode)) )
            case .location:
                specs.append( (spec.rawValue, "Lat: \(detailModel.location.latitude) Long: \(detailModel.location.longitude)") )
            case .timezone:
                specs.append( (spec.rawValue, "\(String(describing: detailModel.city.timeZoneName ?? ""))") )
            }
        }
    }

    func viewDidLoad() {
        setupSpecs()
    }
}
