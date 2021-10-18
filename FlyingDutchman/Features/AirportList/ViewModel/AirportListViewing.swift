//
//  AirportListViewing.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import Foundation

enum AirportListViewState {
    case loading
    case loaded
    case failure
}

protocol AirportListViewing {
    var viewStateDidUpdate: ((AirportListViewState) -> Void)? { get set }
    var airportCount : Int { get }
    func viewDidLoad()
    func viewDidRetry()
    func modelFor(index: Int) -> AirportModel?
    func viewModelForDetail(at index: Int) -> AirportDetailViewModel?
}
