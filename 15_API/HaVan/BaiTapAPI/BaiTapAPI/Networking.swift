//
//  Networking.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: Any]
typealias Completion = (Data?, APIError?) -> Void

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let error):
            return error
        case .errorURL:
            return "URL String is error"
        }
    }
}

// MARK: - Extension Data
extension Data {
    func toJSON() -> JSON {
        var json : [String: Any] = [ : ]
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSON {
                json = jsonObject
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}

final class Networking {
    
    // MARK: - Properties
    private static var sharedNetworking: Networking = {
        let netWorking = Networking()
        return netWorking
    }()
    
    // MARK: - Public functions
    class func shared() -> Networking {
        return sharedNetworking
    }
    
    func request(with urlString: String, completion : @escaping Completion) {
        guard let url = URL(string: urlString) else {
            let error = APIError.errorURL
            completion(nil,APIError.error(error.localizedDescription))
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, APIError.error(error.localizedDescription))
            } else {
                if let data = data {
                    completion(data,nil)
                } else {
                    completion(nil, APIError.error("Data format is error"))
                }
            }
        }
        task.resume()
    }
}
