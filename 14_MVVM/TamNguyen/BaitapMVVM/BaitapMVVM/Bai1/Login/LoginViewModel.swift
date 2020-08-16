//
//  LoginViewModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

typealias CallBack = ([String: String]) -> Void

typealias  ValidationCallBack = (Bool) -> Void

final class LoginViewModel {
    
    // MARK: - Properties
    private let userInfor: [String: String] = ["abc": "123"]
    
    // MARK: - Function
    func getUserInfoLocal(completion: CallBack) {
        completion(userInfor)
    }
    
    func validateUserNamePassword(userName: String, password: String, completion: ValidationCallBack) {
        let userNameRight = userInfor.keys.first ?? ""
        let passwordRight = userInfor[userNameRight]
        if userName == userNameRight, password == passwordRight {
            completion(true)
        } else {
            completion(false)
        }
    }
}
