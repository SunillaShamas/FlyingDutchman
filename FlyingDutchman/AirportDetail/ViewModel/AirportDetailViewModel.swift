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
typealias Specification = (String, String)

class AirportDetailViewModel {
    private let detailModel: AirportModel
    private lazy var specs : [Specification] = []

    var specificationsCount: Int {
        specs.count
    }

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

    func specificationFor(index: Int) -> Specification? {
        guard  index >= 0, index < specificationsCount else { return nil }
        return specs[index]
    }
}
