//
//  XCNetWorkManager.swift
//  XCoins
//
//  Created by Apple on 06/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
class DANetworkManager: NSObject {
    static let shared = DANetworkManager()
}

// MARK:- LogIn Services
extension DANetworkManager {
    func getAlbumList(completionHandler: @escaping RequestCallBackClosure) {
        guard let requestResponse: DAAPIBaseRequestResponse = DAAPIRequestFactory.requestFrom(type: .getSongsLists) else { return }
        requestResponse.executeRequest(completionHandler: completionHandler)
    }
}
