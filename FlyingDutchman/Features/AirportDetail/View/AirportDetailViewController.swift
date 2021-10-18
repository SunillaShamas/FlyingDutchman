//
//  AirportDetailViewController.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 17/10/21.
//

import UIKit

class AirportDetailViewController: UIViewController {

    private var viewModel: AirportDetailViewing

    @IBOutlet private weak var stackView: UIStackView!

    init(viewModel: AirportDetailViewing) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: AirportDetailViewController.self), bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let specs = viewModel.specificationsCount
        guard specs > 0 else {
            // For some reason there are no specs to be displayed,
            // add a back button, for user to be able to go back to previous screen
            addBackButton()
            return
        }

        for index in 0...specs {
            if let row = AirportDetailRow.make(),
               let specification = viewModel.specificationFor(index: index)
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
