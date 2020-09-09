//
//  API.swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

//MARK: - Defines
enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error"
        }
    }
}

typealias APICompletion<T> = (Result<T, APIError>) -> Void

enum APIResult {
    case success(Data?)
    case failure(APIError)
}

//MARK: - API
struct API {
    //singleton
    private static var shareAPI: API = {
        let shareAPI = API()
        return shareAPI
    }()
    
    static func shared() -> API {
        return shareAPI
    }
    
    private init() {}
}
