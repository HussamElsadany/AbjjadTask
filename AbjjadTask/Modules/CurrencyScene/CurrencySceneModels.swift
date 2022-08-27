//
//  CurrencySceneModels.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum CurrencyScene {
    enum Currency { }
}

extension CurrencyScene.Currency {

    struct Currency {
        let name: String
    }

    struct ViewModel {
        let currencies: [Currency]
    }
}
