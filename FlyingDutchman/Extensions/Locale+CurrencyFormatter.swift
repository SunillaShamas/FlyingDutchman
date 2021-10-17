//
//  Locale+CurrencyFormatter.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import Foundation

extension Locale {
    static func getFormattedCurrency(countryCode : String) -> String {
        let locale = Locale(identifier: Locale.identifier(fromComponents: [NSLocale.Key.countryCode.rawValue: countryCode]))
        let code = locale.currencyCode
        let symbol = locale.localizedString(forCurrencyCode: code ?? "")

        return String(describing: "\(code ?? "") - \(symbol ?? "")")
    }

}
