//
//  Details+CoreDataProperties.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }

    @NSManaged public var image: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var idCoffee: String?
    @NSManaged public var coffeeDeltails: Coffee?

}
