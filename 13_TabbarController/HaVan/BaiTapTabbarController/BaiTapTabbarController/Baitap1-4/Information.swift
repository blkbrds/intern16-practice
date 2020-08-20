//
//  Information.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class Information {
    
    private(set) var username: String
    private(set) var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

final class InformationFactory {
    private var informationList = [Information(username: "abc", password: "12345"),
                                   Information(username: "a", password: "12345")]
    
    static var shared = InformationFactory()
    
    func checkInformation(username: String, password: String) -> String? {
        for user in informationList {
            if user.username == username && user.password == password {
                return nil
            }
        }
        return "You entered the wrong username or password"
    }
    
    func createNewAccount(username: String, password: String) -> String? {
        for user in informationList {
            if user.username == username {
                return "the username has already exist"
            }
        }
        informationList.append(Information(username: username, password: password))
        return nil
    }
    
    func changePassword(username: String, newpassword: String, confirmNewPassword:String) -> String? {
        if newpassword != confirmNewPassword {
            return "The new password and confirm new password have to be the same"
        } else {
            for user in 0...informationList.count - 1 {
                if informationList[user].username == username {
                    let newUser = Information(username: username, password: newpassword)
                    informationList.remove(at: user)
                    informationList.append(newUser)
                    return nil
                }
            }
            return "The username doesn't exist"
        }
    }
}
