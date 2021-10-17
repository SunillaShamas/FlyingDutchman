//
//  ViewController.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!

    private var viewModel: FlyingListViewModel = .init()
    
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
        viewModel.viewStateDidUpdate = { [weak self] state in
            guard let self = self else { return }

            self.loadingIndicator.isHidden = true
            self.tableView.isHidden = true

            switch state {
            case .loading:
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
            case .loaded:
                self.tableView.isHidden = false
            case .failure:
                self.tableView.isHidden = false
            }
        }
    }

}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        .init()
    }


}

