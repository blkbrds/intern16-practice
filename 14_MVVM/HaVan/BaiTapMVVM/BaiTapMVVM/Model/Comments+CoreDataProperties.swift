//
//  Comments+CoreDataProperties.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//
//

import Foundation
import CoreData


extension Comments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comments> {
        return NSFetchRequest<Comments>(entityName: "Comments")
    }

    @NSManaged public var idCoffee: String?
    @NSManaged public var username: String?
    @NSManaged public var comment: String?
    @NSManaged public var coffeeComments: Coffee?

}
