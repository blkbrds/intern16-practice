//
//  Networking.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

extension Data {
    
    func toJSON() -> JSONObject {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JSONObject {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
