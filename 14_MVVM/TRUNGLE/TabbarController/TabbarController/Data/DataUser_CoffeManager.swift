//
//  DataManager.swift
//  TabbarController
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
class DataUser_CoffeManager {
    
    // MARK: - Properties
    var name: String
    var image: String
    var address: String
    var distance: String
    var rate: String
    var favorite: Bool

    // MARK: - Init
    init(name: String = "", image: String = "", address: String = "", distance: String = "", rate: String = "", favorite: Bool = false) {
        self.name = name
        self.image = image
        self.address = address
        self.distance = distance
        self.rate = rate
        self.favorite = favorite
    }
    //singleton
    private static var sharedDataManager: DataUser_CoffeManager = {
        let dataManager = DataUser_CoffeManager()
        return dataManager
    }()
    
    class func shared() -> DataUser_CoffeManager {
        return sharedDataManager
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
