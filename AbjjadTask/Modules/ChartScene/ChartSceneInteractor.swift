//
//  ChartSceneInteractor.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ChartSceneBusinessLogic: AnyObject {

}

protocol ChartSceneDataStore: AnyObject {

}

class ChartSceneInteractor: ChartSceneBusinessLogic, ChartSceneDataStore {

    // MARK: Stored Properties
    let presenter: ChartScenePresentationLogic

    // MARK: Initializers
    required init(presenter: ChartScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension ChartSceneInteractor {

}
