//
//  InfoManagement.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/2/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

final class InfoManagement {

    static func getData(key: String) -> Any? {
        if let path = Bundle.main.path(forResource: "UserInfo", ofType: "plist"), let accountInfo = NSDictionary(contentsOfFile: path) {
            for account in accountInfo {
                if account.key as! String == key {
                    return account.value
                }
            }
            return nil
        }
        return nil
    }

    static func checkInfo(username: String, pass: String) -> Bool {
        guard let password = getData(key: username) else { return false }
        if pass == password as! String {
            return true
        }
        return false
    }

    static func updateData(oldUsername: String, newUsername: String, newPass: String) {
        if let path = Bundle.main.path(forResource: "UserInfo", ofType: "plist"), let accountInfo = NSMutableDictionary(contentsOfFile: path) {
            accountInfo.setObject(newPass, forKey: newUsername as NSCopying)
            accountInfo.removeObject(forKey: oldUsername)
        }
    }
}


