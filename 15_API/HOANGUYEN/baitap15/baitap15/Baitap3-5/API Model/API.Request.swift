//
//  API.Request.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

extension API {
    
    //with url string
    func request(urlString: String, completion: @escaping (APIResult) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        let newData = data.convertToJSON()
                        completion(.success(newData))
                    } else {
                        completion(.failure(.error("can’t get data")))
                    }
                }
            }
        }
        dataTask.resume()
    }
    //with url
    func request(url: URL, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        let newData = data.convertToJSON()
                        completion(.success(newData))
                    }
                }
            }
        }
        dataTask.resume()
    }
    //with request
    func request(request: URLRequest, completion: @escaping (APIResult) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.error(error.localizedDescription)))
                } else {
                    if let data = data {
                        let newData = data.convertToJSON()
                        completion(.success(newData))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
