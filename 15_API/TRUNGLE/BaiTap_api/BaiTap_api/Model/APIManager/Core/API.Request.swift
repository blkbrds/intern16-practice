//
//  API.Request.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
extension API {
    
    //With URL String
    func requestURLString(urlString: String, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {(data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.fail(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //With url
    func requestURL( url: URL, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {(data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.fail(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //With request
    func request(request: URLRequest, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.fail(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        completion(.success(data))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
