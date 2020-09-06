//
//  Data.ext.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

extension Data {
    
    func convertToJSON() -> JsonObject {
        var json: JsonObject = JsonObject()
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? JsonObject {
                json = jsonObj
            }
        } catch {
            print("JSON Casting ERROR")
        }
        return json
    }
}
