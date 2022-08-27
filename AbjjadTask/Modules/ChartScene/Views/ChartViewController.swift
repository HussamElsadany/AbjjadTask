//
//  ChartViewController.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ChartSceneDisplayView: AnyObject {

}

class ChartViewController: UIViewController {

    var interactor: ChartSceneBusinessLogic!
    var dataStore: ChartSceneDataStore!
    var viewStore: ChartSceneViewStore!
    var router: ChartSceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ChartViewController: ChartSceneDisplayView {

}
