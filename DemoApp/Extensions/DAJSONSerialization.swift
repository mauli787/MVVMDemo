//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation

extension Dictionary {
    // Converting JSON Object / Dictionary To Data
    func dataWithJSONObject() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {}
        return Data()
    }
}

extension Data {
    // Converting Data to JSON Object / Dictionary
    func jsonObjectWithData() -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: [])
        } catch {}
        return nil
    }
}

extension Array {
    // Converting Array JSON Object To Data
    func dataWithJSONObject() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {}
        return Data()
    }
    
}

open class JSONObject: NSObject {
    open class func dataWithJSONObject(json: AnyObject) -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: [])
        } catch {}
        return Data()
    }
}

