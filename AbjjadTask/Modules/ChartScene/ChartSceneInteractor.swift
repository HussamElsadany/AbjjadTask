//
//  ChartSceneInteractor.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartSceneBusinessLogic: AnyObject {
    func fetchChart()
}

protocol ChartSceneDataStore: AnyObject {
    var selectedCurrency: CurrencyModel? { get set }
    var chart: ChartModelResponse? { get set }
}

class ChartSceneInteractor: ChartSceneBusinessLogic, ChartSceneDataStore {

    // MARK: Stored Properties
    private let presenter: ChartScenePresentationLogic
    private let worker: ChartSceneWorkersLogic

    var selectedCurrency: CurrencyModel?
    var chart: ChartModelResponse?

    private var limit: Int = 100
    private var interval: Int = 15

    // MARK: Initializers
    required init(presenter: ChartScenePresentationLogic, worker: ChartSceneWorkersLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension ChartSceneInteractor {

    func fetchChart() {
        guard let currency = selectedCurrency else {
            return
        }
        worker.fetchCurrencyData(symbol: currency.value,
                                 limit: limit,
                                 interval: interval) { [weak self] response in
            self?.chart = response
            self?.presenter.present(chart: response)
        } failure: { error in
            
        }
    }
}
