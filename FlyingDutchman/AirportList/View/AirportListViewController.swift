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
        setupTableHeaderView()
    }

    private func setupTableHeaderView() {
        let header  = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = "Airports"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)

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


extension UIView {
    /// Constraint to a layout guide using the provided margins. Provide a nil margin if you wish for a certain edge to remain un-pinned.
    func constrain(to view: UIView,
                   topMargin: CGFloat? = 0,
                   bottomMargin: CGFloat? = 0,
                   leadingMargin: CGFloat? = 0,
                   trailingMargin: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints: [NSLayoutConstraint?] = [
            topMargin.map({ topAnchor.constraint(equalTo: view.topAnchor, constant: $0) }),
            bottomMargin.map({ bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -$0) }),
            leadingMargin.map({ leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: $0) }),
            trailingMargin.map({ trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -$0) })
        ]

        NSLayoutConstraint.activate(constraints.compactMap({ $0 }))
    }
}
