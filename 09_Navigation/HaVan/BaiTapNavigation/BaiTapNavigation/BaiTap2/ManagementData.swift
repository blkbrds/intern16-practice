//
//  ManagementData.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class ManagementData {
    static func getData(key: String) -> Any? {
        if let path = Bundle.main.path(forResource: "UserData", ofType: "plist"), let myDict = NSDictionary(contentsOfFile: path){
            for acount in myDict {
                if acount.key as! String == key {
                    return acount.value
                }
            }
            return nil
        }
        return nil
    }
    
    static func checkInformation(username: String, pass: String) -> Bool {
        guard let password = getData(key: username) else { return false }
        if pass == password as! String {
            return true
        }
        return false
    }
}
