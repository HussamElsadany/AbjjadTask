//
//  CurrencyViewController.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CurrencySceneDisplayView: AnyObject {
    func displayCurrencies(viewModel: CurrencyScene.Currency.ViewModel)
}

class CurrencyViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var interactor: CurrencySceneBusinessLogic!
    var dataStore: CurrencySceneDataStore!
    var viewStore: CurrencySceneViewStore!
    var router: CurrencySceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.fetchCurrencies()
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Symbols"
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.registerCell(CurrencyTableViewCell.self)
    }
}

extension CurrencyViewController: CurrencySceneDisplayView {
    func displayCurrencies(viewModel: CurrencyScene.Currency.ViewModel) {
        tableView.reloadData()
    }
}

extension CurrencyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewStore.currenciesViewModel?.currencies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyTableViewCell = tableView.dequeueReusableCell()
        if let viewModel = viewStore.currenciesViewModel?.currencies[indexPath.row] {
            cell.configureCell(viewModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CurrencyTableViewCell else {
            return
        }
        cell.setRadius(first: indexPath.row == 0,
                       last: (indexPath.row + 1) == viewStore.currenciesViewModel?.currencies.count)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
