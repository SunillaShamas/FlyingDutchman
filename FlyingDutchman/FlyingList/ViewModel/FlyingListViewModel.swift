//
//  FlyingListViewModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum FlyingListViewState {
    case loading
    case loaded
    case failure
}

class FlyingListViewModel {
    var viewStateDidUpdate: ( (FlyingListViewState) -> Void)?
    func viewDidLoad() {
        //TODO: trigger web fetch request
        viewStateDidUpdate?(.loading)
    }
}
