//
//  API.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

typealias JsonObject = [String: Any]
typealias APICompletion<T> = (Result<T, APIError>)  -> Void

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
      switch self {
      case .error(let string):
        return string
      case .errorURL:
        return "URL String is error."
      }
    }
}

enum APIResult {
    case success(JsonObject)
    case failure(APIError)
}

struct API {
    
    private static var shared: API = {
        let sharedAPI = API()
        return sharedAPI
    }()
    
    static func sharedAPI() -> API {
        return shared
    }
}
