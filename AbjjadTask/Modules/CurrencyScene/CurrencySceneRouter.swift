//
//  CurrencySceneRouter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CurrencySceneRoutingLogic: AnyObject {
    typealias Controller = CurrencySceneDisplayView & CurrencyViewController
}

class CurrencySceneRouter {

    // MARK: Stored Properties
    var viewController: Controller?

    // MARK: Initializers
    required init(controller: Controller?) {
        self.viewController = controller
    }
}

extension CurrencySceneRouter: CurrencySceneRoutingLogic {

}
