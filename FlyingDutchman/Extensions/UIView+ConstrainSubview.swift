//
//  UIView+ConstrainSubview.swift
//  FlyingDutchman
//
//  Created by Sunilla Sarfraz on 18/10/21.
//

import Foundation
import UIKit

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
