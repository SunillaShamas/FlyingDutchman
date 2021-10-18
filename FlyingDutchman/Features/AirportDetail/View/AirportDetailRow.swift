//
//  AirportDetailRow.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import UIKit

class AirportDetailRow: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    static func make() -> AirportDetailRow? {
        let airportDetailRow = Bundle.main.loadNibNamed("AirportDetailRow", owner: nil, options: nil)?.first as? AirportDetailRow
        return airportDetailRow
    }
}
