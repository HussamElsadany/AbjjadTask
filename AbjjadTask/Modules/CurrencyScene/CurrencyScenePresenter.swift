//
//  CurrencyScenePresenter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencyScenePresentationLogic: AnyObject {
    func present(currencies: [CurrencyModel])
}

protocol CurrencySceneViewStore: AnyObject {
    var currenciesViewModel: CurrencyScene.Currency.ViewModel? { get set }
}

class CurrencyScenePresenter: CurrencyScenePresentationLogic, CurrencySceneViewStore {

    // MARK: Stored Properties
    private weak var displayView: CurrencySceneDisplayView?

    var currenciesViewModel: CurrencyScene.Currency.ViewModel?

    // MARK: Initializers
    required init(displayView: CurrencySceneDisplayView) {
        self.displayView = displayView
    }
}

extension CurrencyScenePresenter {
    
    func present(currencies: [CurrencyModel]) {
        let currenciesViewModels = currencies.map {
            return generateCurrencyViewModel($0)
        }
        currenciesViewModel = CurrencyScene.Currency.ViewModel(currencies: currenciesViewModels)
        displayView?.displayCurrencies(viewModel: currenciesViewModel!)
    }
}

private extension CurrencyScenePresenter {
    func generateCurrencyViewModel(_ currency: CurrencyModel) -> CurrencyScene.Currency.Currency {
        return CurrencyScene.Currency.Currency(name: currency.title)
    }
}
