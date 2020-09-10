//
//  DataManager.swift
//  TabbarController
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
class LoginManager {
    
    //singleton
    private static var sharedLoginManager: LoginManager = {
        let loginManager = LoginManager()
        return loginManager
    }()
    
    class func shared() -> LoginManager {
        return sharedLoginManager
    }
    
    //open database
    func getUser() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email, password)
    }
    
    //save database
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
    }
}
