//
//  User+CoreDataProperties.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//
//

import Foundation
import CoreData

extension User {
    
    // MARK: - Properties
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    
    // MARK: Public functions
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}
