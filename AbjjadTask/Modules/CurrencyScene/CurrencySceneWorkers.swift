//
//  CurrencySceneWorkers.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencySceneWorkersLogic: AnyObject {
    func getAllCurrencies(success: @escaping([CurrencyModel]) -> Void)
}

class CurrencySceneWorkers: CurrencySceneWorkersLogic {

    func getAllCurrencies(success: @escaping([CurrencyModel]) -> Void) {
        //TODO: Create DataSource for these currencies.
        let currency1 = CurrencyModel(title: "BTC", value: "BTCUSDT")
        let currency2 = CurrencyModel(title: "LTC", value: "LTCUSDT")
        let currency3 = CurrencyModel(title: "ETH", value: "ETHUSDT")
        success([currency1, currency2, currency3])
    }
}
