//
//  Bai1ViewController.swift
//  BaiTap_api
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import UIKit
typealias Completion = (Data) -> Void
class Bai1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAPI(completion: { (data) in
        })
    }
    
    func convertToJSON( from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]  {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
    func loadAPI(completion: @escaping Completion) {
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
