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
        guard let specs = viewModel?.specificationsCount, specs > 0 else {
            addBackButton()
            return
        }
        for index in 0...specs {
            if let row = AirportDetailRow.make(),
               let specification = viewModel?.specificationFor(index: index)
            {
                row.titleLabel.text = specification.0
                row.descriptionLabel.text = specification.1
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
