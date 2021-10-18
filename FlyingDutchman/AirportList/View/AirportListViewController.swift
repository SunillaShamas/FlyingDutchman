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

    private var viewModel: AirportViewing = AirportListDependencyProvider.getViewModel()

    private var headerLabel: UILabel {
        let label = UILabel()
        label.text = "Airports"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }
    
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
        setupTableHeaderView()
    }

    private func setupTableHeaderView() {
        let header  = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false

        let label = headerLabel
        header.addSubview(label)
        label.constrain(to: header, topMargin: 10, bottomMargin: 10, leadingMargin: 10, trailingMargin: 10)

        tableView.tableHeaderView = header
        header.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        header.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        tableView.tableHeaderView?.layoutIfNeeded()
    }

    private func setupViewModel() {
        viewModel.viewStateDidUpdate = updateView
    }

    func updateView(state: AirportListViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.loadingIndicator.isHidden = true
            self.tableView.isHidden = true

            switch state {
            case .loading:
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
            case .loaded:
                self.tableView.isHidden = false
                self.tableView.reloadData()
            case .failure:
                self.tableView.isHidden = false
                self.showRetryAlert()
            }
        }
    }

    func showRetryAlert() {
        let alert = UIAlertController(title: "Something went wrong...",
                                      message: "There was an issue retrieving the list for you.",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Try Again",
                                      style: .default,
                                      handler: { [weak self] action in
            self?.viewModel.viewDidRetry()
        }))

        present(alert, animated: true)
    }

}

extension AirportListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.viewModelForDetail(at: indexPath.row) else { return }

        let detailsViewController = AirportDetailViewController(viewModel: model)
        detailsViewController.modalPresentationStyle = .fullScreen
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
