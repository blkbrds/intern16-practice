//
//  LoginViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class LoginViewModel {
    
    //MARK: - Properties
    var userName: String = "trung"
    var passWord: String = "123"
    enum LoginResult {
        case sucess
        case failure(Bool, String)
    }
    
    //MARK: - typealias
    typealias Completion = (LoginResult) ->Void
    //MARK: - Init
    init(userName: String, passWord: String) {
        self.userName = userName
        self.passWord = passWord
    }
    //MARK: - Action
    func login(userName: String, passWord: String, completion: Completion) {
        if(userName == "") || passWord == "" {
            completion(.failure(true, "Mat khau hoac userName Rong"))
        } else {
            //Cap nha du lieu
            self.userName = ""
            self.passWord = ""
            //Call back
            completion(.sucess)
        }
    }
}
