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
        addBackButton()
    }

    private func addBackButton() {
        let backButton = UIButton()
        backButton.setTitle("Go Back", for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
        stackView.addArrangedSubview(backButton)
    }

    @objc private func goBack() {
        self.dismiss(animated: true)
    }


}
