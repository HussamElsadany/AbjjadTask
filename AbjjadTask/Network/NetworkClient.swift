//
//  NetworkClient.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//

import Foundation

// Simple network layer that match with single api caller.
public class NetworkClient {

    public static var shared = NetworkClient()

    // MARK: Network requests
    public func get(_ url: URL, completionHandler: @escaping (Data?) -> Void) {
        executeRequest(url, method: "GET", payload: nil, completionHandler: completionHandler)
    }

    public func post(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Data?) -> Void) {
        executeRequest(url, method: "POST", payload: payload, completionHandler: completionHandler)
    }

    public func put(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Data?) -> Void) {
        executeRequest(url, method: "PUT", payload: payload, completionHandler: completionHandler)
    }

    public func delete(_ url: URL, completionHandler: @escaping (Data?) -> Void) {
        executeRequest(url, method: "DELETE", payload: nil, completionHandler: completionHandler)
    }

    func executeRequest(_ url: URL, method: String, payload: Data?, completionHandler: @escaping (Data?) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = payload
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            completionHandler(data)
        }.resume()
    }
}
