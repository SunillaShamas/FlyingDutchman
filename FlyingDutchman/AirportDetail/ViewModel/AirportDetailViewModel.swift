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
                let currency = Locale.currency[detailModel.country.countryCode]
                specs[spec.rawValue] = "\(String(describing: currency?.name ?? "")) - \(String(describing: currency?.symbol ?? ""))"
            case .location:
                specs[spec.rawValue] = "Lat: \(detailModel.location.latitude) Long: \(detailModel.location.longitude)"
            case .timezone:
                specs[spec.rawValue] = "\(String(describing: detailModel.city.timeZoneName ?? ""))"
            }
        }
    }

    func viewDidLoad() {
        setupSpecs()
    }
}

private extension Locale {
    static let currency: [String: (code: String?, symbol: String?, name: String?)] = isoRegionCodes.reduce(into: [:]) {
        let locale = Locale(identifier: identifier(fromComponents: [NSLocale.Key.countryCode.rawValue: $1]))
        $0[$1] = (locale.currencyCode, locale.currencySymbol, locale.localizedString(forCurrencyCode: locale.currencyCode ?? ""))
    }
}
