//
//  AirportsViewController.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import UIKit

class AirportListViewController: UIViewController {

    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!

    private var viewModel: AirportListViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupViewModel()
        viewModel.viewDidLoad()
    }

    private func setupView() {
        loadingIndicator.isHidden = true
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupViewModel() {
        viewModel.viewStateDidUpdate = updateView
    }

    func updateView(state: AirportListViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            switch state {
            case .loading:
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
            case .loaded:
                self.tableView.isHidden = false
                self.tableView.reloadData()
            case .failure:
                self.tableView.isHidden = false
            }
        }
    }

}

extension AirportListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.viewModelForDetail(at: indexPath.row) else { return }

        let detailsViewController = AirportDetailViewController()
        detailsViewController.viewModel = model

        present(detailsViewController, animated: true)
        
    }
}

extension AirportListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.airportCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath)

        guard let model = viewModel.modelFor(index: indexPath.row) else { return cell }

        cell.textLabel?.text = model.airportName
        cell.detailTextLabel?.text = model.country.countryName
        return cell
    }
}

