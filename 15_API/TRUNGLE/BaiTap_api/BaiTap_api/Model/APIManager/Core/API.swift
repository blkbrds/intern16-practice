//
//  API.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
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
            return "URL bi loi"
        }
    }
}

typealias APICompletion<T> = (Result<T,APIError>) ->Void

enum APIResult {
    case success(Data?)
    case fail(APIError)
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
    
    //Init
    private init(){}
}
