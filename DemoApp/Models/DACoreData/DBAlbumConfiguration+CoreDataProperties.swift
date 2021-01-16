//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation
import CoreData


extension DBAlbumConfiguration {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBAlbumConfiguration> {
        return NSFetchRequest<DBAlbumConfiguration>(entityName: "DBAlbumConfiguration")
    }

    @NSManaged public var response: [String: Any]

}

extension DBAlbumConfiguration : Identifiable {

}
