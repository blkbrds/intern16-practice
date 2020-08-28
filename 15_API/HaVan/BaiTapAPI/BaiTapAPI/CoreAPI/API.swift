//
//  API.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/25/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

enum APIErrors: Error {
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
    case success(JSONObject)
    case failure(APIErrors)
}

struct API {
    
    // MARK: - Properties
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()
    
    // MARK: - Initialize
    private init() {}
    
    // MARK: - Public functions
    static func shared() -> API {
        return shareAPI
    }
}
