//
//  CurrencyTableViewCell.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var currencyTitleLabel: UILabel!

    func configureCell(_ viewModel: CurrencyScene.Currency.Currency) {
        currencyTitleLabel.text = viewModel.name
    }

    func setRadius(first: Bool, last: Bool) {
        if first {
            roundCorners(corners: [.topLeft, .topRight], radius: 16.0)
        } else if last {
            roundCorners(corners: [.bottomLeft, .bottomRight], radius: 16.0)
        } else {
            roundCorners(corners: [], radius: 0)
        }
    }
}
