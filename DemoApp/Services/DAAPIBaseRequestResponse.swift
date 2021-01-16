//
//  XCAPIBaseRequestResponse.swift
//  XCoins
//
//  Created by Apple on 06/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
typealias RequestCallBackClosure = (_ error: Error?, _ response: Any?) -> Void

enum APIEndPointsType {
    case baseURL
    case none
}

class DAAPIBaseRequestResponse: NSObject {
    var requestType: RequestType = .none
    var requestMethod: RequestMethod = .get
    var apiEndPointsType: APIEndPointsType = .baseURL
    
    init(requestType: RequestType, requestMethod: RequestMethod = .get, apiEndPointsType: APIEndPointsType = .baseURL) {
        super.init()
        self.requestType = requestType
        self.requestMethod = requestMethod
        self.apiEndPointsType = apiEndPointsType
    }
    
    private var baseURL: String {
        get {
            switch apiEndPointsType {
            case .baseURL:
                return APIEndPointConstants.baseURL
            case .none:
                return ""
            }
        }
    }
    
    func route() -> String {
        return ""
    }
    
    private func urlString() -> String {
        let url: String = baseURL + route()
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
    func parameters() -> AnyObject? {
        return nil
    }
    
    func multiPartParameters() -> JSONArrayOfDictString? {
        return nil
    }
    
    func uploadPrescriptionParameters() -> [Any]? {
        return nil
    }
    
    private func headers() -> JSONDictString {
        switch requestType {
        default:
            return [
                "Accept": "application/json"
            ]
        }
    }
    
    func parseResponse(response: Any?) -> Any? {
        return nil
    }
    
    func executeRequest(completionHandler: @escaping RequestCallBackClosure) {
        guard let url: URL = URL(string: urlString()) else { completionHandler(nil, nil); return }
        var urlRequest: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
        urlRequest.httpMethod = requestMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers()
        if let params = parameters() {
            if let params = parameters() as? String {
                urlRequest.httpBody = params.data(using: String.Encoding.utf8)
            } else {
                urlRequest.httpBody = JSONObject.dataWithJSONObject(json: params)
            }
        }
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                self.handleJSONResponse(data: data, error: error, completionHandler: completionHandler)
            }
        }.resume()
    }
    
    // TODO:- Response From Data to Dict and return error if not Valid Data
    private func handleJSONResponse(data: Data?, error: Error?, completionHandler: @escaping RequestCallBackClosure) {
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print("URL", urlString())
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        guard error == nil else { completionHandler(error, nil); return }
        guard let validData = data else { completionHandler(error, nil); return }
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print("RESPONSE", validData.jsonObjectWithData() as Any)
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        guard let jsonResponse = self.parseResponse(response: validData.jsonObjectWithData()) else { completionHandler(error, nil); return }
        completionHandler(nil, jsonResponse)
    }
}

