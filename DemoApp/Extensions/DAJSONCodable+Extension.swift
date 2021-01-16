//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation

// MARK:- JSON Decodable
extension Decodable {
    @discardableResult
    static func decode(json: AnyObject) -> Self? {
        if json.isKind(of: NSNull.classForCoder()) {return nil}
        do {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(Self.self, from: JSONObject.dataWithJSONObject(json: json))
        } catch { print("DECODER ERROR IN \(type(of: self))") }
        return nil
    }
    
    @discardableResult
    static func decode(data: Data?) -> Self? {
        guard data != nil else {return nil}
        do {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(Self.self, from: data!)
        } catch { print("DECODER ERROR IN \(type(of: self))") }
        return nil
    }
}

// MARK:- JSON Encodable
extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try? encoder.encode(self)
    }
}
