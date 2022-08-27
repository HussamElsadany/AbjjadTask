//
//  CurrencySceneRouter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencySceneRoutingLogic: AnyObject {
    typealias Controller = CurrencySceneDisplayView & CurrencyViewController

    func routeToChartsScene(currency: CurrencyModel)
}

class CurrencySceneRouter {

    // MARK: Stored Properties
    private var viewController: Controller?

    // MARK: Initializers
    required init(controller: Controller?) {
        self.viewController = controller
    }
}

extension CurrencySceneRouter: CurrencySceneRoutingLogic {

    func routeToChartsScene(currency: CurrencyModel) {
        let chartsViewController = ChartSceneConfigurator.configure()
        chartsViewController.dataStore.selectedCurrency = currency
        viewController?.navigationController?.pushViewController(chartsViewController, animated: true)
    }
}
