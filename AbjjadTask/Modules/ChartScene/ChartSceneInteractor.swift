//
//  ChartSceneInteractor.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartSceneBusinessLogic: AnyObject {
}

protocol ChartSceneDataStore: AnyObject {
    var selectedCurrency: CurrencyModel? { get set }
}

class ChartSceneInteractor: ChartSceneBusinessLogic, ChartSceneDataStore {

    // MARK: Stored Properties
    private let presenter: ChartScenePresentationLogic
    private let worker: ChartSceneWorkersLogic

    var selectedCurrency: CurrencyModel?

    // MARK: Initializers
    required init(presenter: ChartScenePresentationLogic, worker: ChartSceneWorkersLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension ChartSceneInteractor {

}
