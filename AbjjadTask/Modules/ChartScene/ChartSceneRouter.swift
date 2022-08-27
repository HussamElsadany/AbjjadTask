//
//  ChartSceneRouter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartSceneRoutingLogic: AnyObject {
    typealias Controller = ChartSceneDisplayView & ChartViewController
}

class ChartSceneRouter {

    // MARK: Stored Properties
    var viewController: Controller?

    // MARK: Initializers
    required init(controller: Controller?) {
        self.viewController = controller
    }
}

extension ChartSceneRouter: ChartSceneRoutingLogic {

}
