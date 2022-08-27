//
//  ChartSceneModels.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ChartScene {
    enum Chart { }
}

extension ChartScene.Chart {

    struct Candle {
        let openTime: Double
        let open: Double
        let high: Double
        let low: Double
        let close: Double
        let volume: Double
        let closeTime: Double
        let quoteAssetVolume: Double
        let numberOfTrades: Double
        let rakerBuyBaseAssetVolume: Double
        let takerBuyQuoteAssetVolume: Double
        let ignore: Double
    }

    struct ViewModel {
        let candleSticks: [Candle]
    }
}
