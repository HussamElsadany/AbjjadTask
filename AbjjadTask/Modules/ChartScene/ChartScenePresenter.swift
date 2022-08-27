//
//  ChartScenePresenter.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartScenePresentationLogic: AnyObject {

}

protocol ChartSceneViewStore: AnyObject {

}

class ChartScenePresenter: ChartScenePresentationLogic, ChartSceneViewStore {

    // MARK: Stored Properties
    weak var displayView: ChartSceneDisplayView?

    // MARK: Initializers
    required init(displayView: ChartSceneDisplayView) {
        self.displayView = displayView
    }
}

extension ChartScenePresenter {

}
