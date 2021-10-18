//
//  AirportListViewModel.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import Foundation

class AirportListViewModel: AirportListViewing {
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
        fetchData()
    }

    func viewDidRetry() {
        fetchData()
    }

    private func fetchData() {
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

    ///  Returns Airport Model for list entry
    /// - Parameter index: index of item in list
    /// - Returns: AirportModel object, nil if index out of bound
    func modelFor(index: Int) -> AirportModel? {
        guard index >= 0 && index < airportCount else {
            return nil
        }
        return airportList?[index]
    }


    ///  Returns ViewModel for detail view screen
    /// - Parameter index: index of item in list
    /// - Returns: AirportDetailViewModel object, nil if index out of bound
    func viewModelForDetail(at index: Int) -> AirportDetailViewModel? {
        guard let model = modelFor(index: index) else { return nil }
        
        let viewModel = AirportDetailViewModel(detailModel: model)
        return viewModel
    }

}
