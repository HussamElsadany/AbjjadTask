//
//  CurrencySceneInteractor.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencySceneBusinessLogic: AnyObject {

}

protocol CurrencySceneDataStore: AnyObject {

}

class CurrencySceneInteractor: CurrencySceneBusinessLogic, CurrencySceneDataStore {

    // MARK: Stored Properties
    let presenter: CurrencyScenePresentationLogic

    // MARK: Initializers
    required init(presenter: CurrencyScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension CurrencySceneInteractor {

}
