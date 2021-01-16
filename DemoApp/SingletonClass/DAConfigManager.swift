//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation

class DAConfigManager: NSObject {
    static let shared = DAConfigManager()
    var configDetails: Welcome?
}

extension DAConfigManager {
    func getAlbumData() {
        guard let appConfigDetails = CoreDataManager.shared.fetchAllAttributes(forEntityName: DBAlbumConfiguration.entityName()) as? [DBAlbumConfiguration], appConfigDetails.count > 0 else { return }
        guard let response = appConfigDetails.first?.response, let configInfo = Welcome.decode(json: response as AnyObject) else { return }
        self.configDetails = configInfo
    }
    
    func resetConfigDetails(configInfo: Welcome?) {
        CoreDataManager.shared.deleteAll(forEntityName: DBAlbumConfiguration.entityName())
        guard let encodeData = configInfo.encode(), let jSONResponse = encodeData.jsonObjectWithData() else { return }
        CoreDataManager.shared.insertObject(forEntityName: DBAlbumConfiguration.entityName(), attributes: ["response": jSONResponse])
        getAlbumData()
    }
    
    func checkLocalData() -> Int {
        guard let appConfigDetails = CoreDataManager.shared.fetchAllAttributes(forEntityName: DBAlbumConfiguration.entityName()) as? [DBAlbumConfiguration] else { return 0 }
        return appConfigDetails.count
    }
}
