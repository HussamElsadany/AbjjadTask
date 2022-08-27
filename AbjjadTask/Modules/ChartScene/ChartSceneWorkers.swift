//
//  ChartSceneWorkers.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol ChartSceneWorkersLogic: AnyObject {
    func fetchCurrencyData(symbol: String, limit: Int, interval: Int, success: @escaping(ChartModelResponse) -> Void, failure: @escaping(Error) -> Void)
}

class ChartSceneWorkers: ChartSceneWorkersLogic {

    func fetchCurrencyData(symbol: String, limit: Int, interval: Int, success: @escaping(ChartModelResponse) -> Void, failure: @escaping(Error) -> Void) {
        // This is not the best and urls shouldn't be handled from here.
        guard let url = URL(string: "https://fapi.binance.com/fapi/v1/klines?symbol=\(symbol)&interval=\(interval)m&limit=\(limit)") else {
            return
        }

        NetworkClient.shared.get(url) { data in
            guard let data = data else { return }
            do {
                let obj: ChartModelResponse = try JSONDecoder().decode(ChartModelResponse.self, from: data)
                success(obj)
            } catch let error {
                failure(error)
            }
        }
    }
}
