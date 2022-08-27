//
//  CurrencySceneConfigurator.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

class CurrencySceneConfigurator {

    static func configure() -> CurrencyViewController {
        let viewController = CurrencyViewController()
        let presenter = CurrencyScenePresenter(displayView: viewController)
        let interactor = CurrencySceneInteractor(presenter: presenter)
        let router = CurrencySceneRouter(controller: viewController)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        viewController.viewStore = presenter
        return viewController
    }
}
