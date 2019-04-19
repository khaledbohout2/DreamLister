//
//  Store+CoreDataProperties.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//
//

import Foundation
import CoreData


extension Store {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Store> {
        return NSFetchRequest<Store>(entityName: "Store")
    }

    @NSManaged public var name: String?
    @NSManaged public var toimage: Image?
    @NSManaged public var toitem: NSSet?

}

// MARK: Generated accessors for toitem
extension Store {

    @objc(addToitemObject:)
    @NSManaged public func addToToitem(_ value: Item)

    @objc(removeToitemObject:)
    @NSManaged public func removeFromToitem(_ value: Item)

    @objc(addToitem:)
    @NSManaged public func addToToitem(_ values: NSSet)

    @objc(removeToitem:)
    @NSManaged public func removeFromToitem(_ values: NSSet)

}
