//
//  ChartSceneConfigurator.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

class ChartSceneConfigurator {

    static func configure() -> ChartViewController {
        let viewController = ChartViewController()
        let presenter = ChartScenePresenter(displayView: viewController)
        let worker = ChartSceneWorkers()
        let interactor = ChartSceneInteractor(presenter: presenter, worker: worker)
        let router = ChartSceneRouter(controller: viewController)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        viewController.viewStore = presenter
        return viewController
    }
}
