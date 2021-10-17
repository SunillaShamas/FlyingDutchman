//
//  AirportListViewModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

enum AirportListViewState {
    case loading
    case loaded
    case failure
}

class AirportListViewModel {
    private let service: APIService
    private var airportList: AirportListModel?
    var viewStateDidUpdate: ( (AirportListViewState) -> Void)?

    var airportCount : Int {
        airportList?.count ?? 0
    }

    init(apiService: APIService) {
        service = apiService
    }

    func viewDidLoad() {
        viewStateDidUpdate?(.loading)
        service.fetch(urlRequest: AirportListRouter.fetchFlyingList) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let airportListModel):
                self.airportList = airportListModel
                self.viewStateDidUpdate?(.loaded)
            case .failure:
                self.viewStateDidUpdate?(.failure)
            }
        }
    }

    func modelFor(index: Int) -> AirportModel? {
        guard index >= 0 && index < airportCount else {
            return nil
        }
        return airportList?[index]
    }

    func viewModelForDetail(at index: Int) -> AirportDetailViewModel? {
        guard let model = modelFor(index: index) else { return nil }
        
        let viewModel = AirportDetailViewModel(detailModel: model)
        return viewModel
    }

}
