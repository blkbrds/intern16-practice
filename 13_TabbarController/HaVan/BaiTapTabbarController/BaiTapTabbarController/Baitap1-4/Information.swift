//
//  Information.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

class Information {

    private(set) var username: String
    private(set) var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

class InformationFactory {
    private var informationList = [Information(username: "abc", password: "12345"),
                        Information(username: "a", password: "12345")]
    
    static var shared = InformationFactory()
    
    func checkInformation(username: String, password: String) -> Bool {
        for user in informationList {
            if user.username == username && user.password == password {
                return true
            }
        }
        return false
    }
    
    func createNewAccount(username: String, password: String) -> Bool {
        for user in informationList {
            if user.username == username {
                return false
            }
        }
            informationList.append(Information(username: username, password: password))
            return true
        }
    
    func checkPassword(newpassword: String, confirmNewPassword: String) -> Bool {
        if newpassword == confirmNewPassword {
            return true
        }
        return false
    }
    
    func changePassword(username: String, newpassword: String, confirmNewPassword: String) -> Bool {
        for user in 0...informationList.count - 1 {
            if informationList[user].username == username {
                if checkPassword(newpassword: newpassword, confirmNewPassword: confirmNewPassword) {
                    let newUser = Information(username: username, password: newpassword)
                    informationList.remove(at: user)
                    informationList.append(newUser)
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
}
