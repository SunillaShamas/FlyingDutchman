//
//  AirportDetailViewController.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import UIKit

class AirportDetailViewController: UIViewController {

    var viewModel: AirportDetailViewModel?

    @IBOutlet private weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setupView()
    }

    private func setupView() {
        guard let specs = viewModel?.specs else { return }
        for (key,value) in specs {
            if let row = AirportDetailRow.make()
            {
                row.titleLabel.text = key
                row.descriptionLabel.text = value
                stackView.addArrangedSubview(row)
            }
        }
    }


}
