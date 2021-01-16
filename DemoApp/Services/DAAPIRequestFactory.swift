//
//  XCAPIRequestFactory.swift
//  XCoins
//
//  Created by Apple on 06/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class DAAPIRequestFactory: NSObject {
    class func requestFrom(type: RequestType) -> DAAPIBaseRequestResponse? {
        switch type {
        case .getSongsLists:
            return DAAlbumList(requestType: .getSongsLists, apiEndPointsType: .baseURL)        case .none:
            return nil
        }
    }
}
