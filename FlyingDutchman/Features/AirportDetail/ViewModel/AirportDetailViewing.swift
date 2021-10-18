//
//  AirportDetailViewing.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import Foundation

typealias Specification = (String, String)

protocol AirportDetailViewing {
    var specificationsCount: Int { get }
    func viewDidLoad()
    func specificationFor(index: Int) -> Specification?
}
