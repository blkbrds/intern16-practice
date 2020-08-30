//
//  RegisterViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

typealias Callback = (Bool) -> Void

final class RegisterViewModel {
    
    // MARK: - Properties
    var items: [User]?
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    // MARK: - Public functions
    func save(username: String, password: String, completion: Callback) {
        if isValidated(username: username) {
            let newUser = User(context: context)
            newUser.username = username
            newUser.password = password
            do {
                try context.save()
            } catch {
                fatalError("can't save new user")
            }
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func isValidated(username: String) -> Bool {
        guard let items = items else { return true }
        for user in items {
            if user.username == username {
                return false
            }
        }
        return true
    }
    
    func fetchUser() {
        do {
            items = try context.fetch(User.fetchRequest())
        } catch {
            fatalError("can't load items")
        }
    }
}
