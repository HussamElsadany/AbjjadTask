//
//  CurrencySceneInteractor.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencySceneBusinessLogic: AnyObject {
    func fetchCurrencies()
}

protocol CurrencySceneDataStore: AnyObject {
    var currencies: [CurrencyModel] { set get }
}

class CurrencySceneInteractor: CurrencySceneBusinessLogic, CurrencySceneDataStore {

    // MARK: Stored Properties
    private let presenter: CurrencyScenePresentationLogic
    private let worker: CurrencySceneWorkersLogic

    var currencies: [CurrencyModel] = []

    // MARK: Initializers
    required init(presenter: CurrencyScenePresentationLogic, worker: CurrencySceneWorkersLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension CurrencySceneInteractor {

    func fetchCurrencies() {
        worker.getAllCurrencies { [weak self] currencies in
            self?.currencies = currencies
            self?.presenter.present(currencies: self?.currencies ?? [])
        }
    }
}
