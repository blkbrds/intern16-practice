//
//  Loginmanager.swift
//  TabBar
//
//  Created by MacBook Pro on 8/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct LoginInformation {
    var username: String
    var password: String
}

final class LoginManager {
    
    // MARK: - Peroperties
    private var account: [LoginInformation] = [LoginInformation(username: "minh", password: "123")]
    static let shared = LoginManager()
    private(set) var loginInfo: LoginInformation?
    
    // MARK: - Public functions
    func saveData(loginInfo: LoginInformation) {
        self.loginInfo = loginInfo
    }
    
    func deleteData() {
        self.loginInfo = nil
    }
    
    func checkAccount(username: String, password: String) -> Bool {
        for acc in account {
            if acc.username == username && acc.password == password {
                return true
            }
        }
        return false
    }
    
    func registerAccount(username: String, password: String, confirmpw: String) -> Bool {
        let user: [LoginInformation] = [LoginInformation(username: username, password: password)]
        for acc in account {
            if acc.username != username {
                if password == confirmpw {
                    account.append(contentsOf: user)
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
    
    func forgotPassword(username: String, newPass: String, confirmNewPass: String) -> Bool {
        let user: [LoginInformation] = [LoginInformation(username: username, password: newPass)]
        for acc in 0..<account.count {
            if account[acc].username == username {
                if newPass == confirmNewPass {
                    account.remove(at: acc)
                    account.append(contentsOf: user)
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
}
