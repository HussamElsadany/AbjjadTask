//
//  CurrencyViewController.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CurrencySceneDisplayView: AnyObject {

}

class CurrencyViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var interactor: CurrencySceneBusinessLogic!
    var dataStore: CurrencySceneDataStore!
    var viewStore: CurrencySceneViewStore!
    var router: CurrencySceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Symbols"
    }
}

extension CurrencyViewController: CurrencySceneDisplayView {

}

extension CurrencyViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Hussam \(indexPath.row)"
        return cell
    }
}
