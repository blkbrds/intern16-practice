//
//  ForgotPasswordViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

final class ForgotPasswordViewModel {
    
    // MARK: - Properties
    var items: [User]?
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    // MARK: - Public functions
    func fetchUser() {
        do {
            items = try context.fetch(User.fetchRequest())
        } catch {
            fatalError("can't fetch user")
        }
    }
    
    func changePass(username: String, password: String, completion: Callback) {
        guard let items = items else {
            completion(false)
            return
        }
        for user in items {
            if user.username == username {
                user.password = password
                completion(true)
            }
        }
        completion(false)
    }
}
