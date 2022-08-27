//
//  ChartViewController.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Charts

protocol ChartSceneDisplayView: AnyObject {
    func display(viewModel: ChartScene.Chart.ViewModel)
}

class ChartViewController: UIViewController {

    @IBOutlet private weak var activityIndecator: UIActivityIndicatorView!
    @IBOutlet private weak var chartView: CandleStickChartView!
    
    var interactor: ChartSceneBusinessLogic!
    var dataStore: ChartSceneDataStore!
    var viewStore: ChartSceneViewStore!
    var router: ChartSceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.fetchChart()
    }

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = dataStore.selectedCurrency?.title

        chartView.chartDescription.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true
    }

    private func setupChartUI() {
        chartView.isHidden = false
        chartView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2980392157, blue: 0.2980392157, alpha: 1)
        chartView.leftAxis.labelTextColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
        chartView.rightAxis.labelTextColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
    }
}

extension ChartViewController: ChartSceneDisplayView {
    func display(viewModel: ChartScene.Chart.ViewModel) {
        DispatchQueue.main.async {
            self.activityIndecator.stopAnimating()
            self.setData()
        }
    }
}

extension ChartViewController: ChartViewDelegate {

}

private extension ChartViewController {

    func setData() {
        guard let viewModel = viewStore.chartViewModel?.candleSticks else {
            return
        }

        let yVals1 = (0..<viewModel.count).map { (i) -> CandleChartDataEntry in
            return CandleChartDataEntry(x: Double(i),
                                        shadowH: viewModel[i].high,
                                        shadowL: viewModel[i].low,
                                        open: viewModel[i].open,
                                        close: viewModel[i].close)
        }
        let set1 = CandleChartDataSet(entries: yVals1)
        set1.axisDependency = .left
        set1.drawIconsEnabled = true
        set1.decreasingColor = #colorLiteral(red: 0, green: 0.8196078431, blue: 1, alpha: 1)
        set1.decreasingFilled = true
        set1.increasingColor = #colorLiteral(red: 1, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        set1.increasingFilled = true
        set1.valueTextColor = .white

        let data = CandleChartData(dataSet: set1)
        chartView.data = data
        setupChartUI()
    }
}
