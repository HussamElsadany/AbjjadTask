//
//  ChartScenePresenter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartScenePresentationLogic: AnyObject {
    func present(chart: ChartModelResponse)
}

protocol ChartSceneViewStore: AnyObject {
    var chartViewModel: ChartScene.Chart.ViewModel? { set get }
}

class ChartScenePresenter: ChartScenePresentationLogic, ChartSceneViewStore {

    // MARK: Stored Properties
    private weak var displayView: ChartSceneDisplayView?

    var chartViewModel: ChartScene.Chart.ViewModel?

    // MARK: Initializers
    required init(displayView: ChartSceneDisplayView) {
        self.displayView = displayView
    }
}

extension ChartScenePresenter {

    func present(chart: ChartModelResponse) {
        let candleViewModels = chart.map {
            return generateCandle($0)
        }
        chartViewModel = ChartScene.Chart.ViewModel(candleSticks: candleViewModels)
        displayView?.display(viewModel: chartViewModel!)
    }
}

private extension ChartScenePresenter {

    func generateCandle(_ candle: [ChartModel]) -> ChartScene.Chart.Candle {

        return ChartScene.Chart.Candle(openTime: getValue(chart: candle[safe: 0]),
                                       open: getValue(chart: candle[safe: 1]),
                                       high: getValue(chart: candle[safe: 2]),
                                       low: getValue(chart: candle[safe: 3]),
                                       close: getValue(chart: candle[safe: 4]),
                                       volume: getValue(chart: candle[safe: 5]),
                                       closeTime: getValue(chart: candle[safe: 6]),
                                       quoteAssetVolume: getValue(chart: candle[safe: 7]),
                                       numberOfTrades: getValue(chart: candle[safe: 8]),
                                       rakerBuyBaseAssetVolume: getValue(chart: candle[safe: 9]),
                                       takerBuyQuoteAssetVolume: getValue(chart: candle[safe: 10]),
                                       ignore: getValue(chart: candle[safe: 11]))
    }

    func getValue(chart: ChartModel?) -> Double {
        guard let chart = chart else {
            return 0
        }

        switch chart {
        case .double(let double):
            return double
        case .string(let string):
            return Double(string) ?? 0
        }
    }
}
