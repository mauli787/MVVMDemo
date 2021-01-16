//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Dnyaneshwar on 09/01/21.
//

import Foundation

typealias JSONDictAny = [String: Any]
typealias JSONDictString = [String: String]
typealias JSONArrayOfDictString = [[String: String]]
typealias JSONArrayOfDictAny = [[String: Any]]

struct APIEndPointConstants {
    static let baseURL = "http://ax.itunes.apple.com"
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestType: String {
    case getSongsLists
    case none
}
