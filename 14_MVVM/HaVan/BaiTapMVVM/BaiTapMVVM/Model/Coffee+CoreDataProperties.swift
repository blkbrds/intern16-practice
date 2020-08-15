//
//  Coffee+CoreDataProperties.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/15/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//
//

import Foundation
import CoreData


extension Coffee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coffee> {
        return NSFetchRequest<Coffee>(entityName: "Coffee")
    }

    @NSManaged public var nameCoffee: String?
    @NSManaged public var address: String?
    @NSManaged public var rate: Int16
    @NSManaged public var vote: Bool
    @NSManaged public var comments: NSSet?
    @NSManaged public var details: NSSet?

}

// MARK: Generated accessors for comments
extension Coffee {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comments)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comments)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

}

// MARK: Generated accessors for details
extension Coffee {

    @objc(addDetailsObject:)
    @NSManaged public func addToDetails(_ value: Details)

    @objc(removeDetailsObject:)
    @NSManaged public func removeFromDetails(_ value: Details)

    @objc(addDetails:)
    @NSManaged public func addToDetails(_ values: NSSet)

    @objc(removeDetails:)
    @NSManaged public func removeFromDetails(_ values: NSSet)

}
