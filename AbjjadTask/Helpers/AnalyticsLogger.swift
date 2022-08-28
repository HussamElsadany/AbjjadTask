//
//  AnalyticsLogger.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 28/08/2022.
//

import Foundation
import FirebaseAnalytics


enum AnalyticsEvent {
    case screenName(screen: String)
    case error(message: String)
}

extension AnalyticsEvent {
    var name: String {
        switch self {
        case .screenName(let screen):
            return screen
        case .error(let message):
            return message
        }
    }
}

class AnalyticsLogger {
    static let shared = AnalyticsLogger()

    func log(_ event: AnalyticsEvent, params: [String : Any]? = nil) {
        Analytics.logEvent(event.name, parameters: params)
    }
}
