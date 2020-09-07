//
//  DataManager.swift
//  TabbarController
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
class DataManager {
    
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
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager()
        return dataManager
    }()
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    //open database
    func read() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email, password)
    }
    
    //save database
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
