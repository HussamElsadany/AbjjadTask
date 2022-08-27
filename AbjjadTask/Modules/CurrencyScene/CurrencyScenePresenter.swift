//
//  CurrencyScenePresenter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencyScenePresentationLogic: AnyObject {

}

protocol CurrencySceneViewStore: AnyObject {

}

class CurrencyScenePresenter: CurrencyScenePresentationLogic, CurrencySceneViewStore {

    // MARK: Stored Properties
    weak var displayView: CurrencySceneDisplayView?

    // MARK: Initializers
    required init(displayView: CurrencySceneDisplayView) {
        self.displayView = displayView
    }
}

extension CurrencyScenePresenter {

}
