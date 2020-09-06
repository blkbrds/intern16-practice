//
//  ViewController.swift
//  baitap15
//
//  Created by NXH on 8/18/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

typealias Callback = (Data) -> Void

final class Baitap01ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataAPI(completion: { (data) in
        })
    }
    
    // MARK: - Private func
    
    private func convertToJSON( from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON Casting ERROR")
        }
        return json
    }
    
    private func showDataAPI(completion: @escaping Callback) {
        guard let url = URL(string: "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json") else { return }
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, respond, err) in
            guard let data = data else { return }
            print(self.convertToJSON(from: data))
            completion(data)
        }
        task.resume()
    }
}

