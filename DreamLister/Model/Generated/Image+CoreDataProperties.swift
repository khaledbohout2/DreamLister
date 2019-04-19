//
//  Image+CoreDataProperties.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toitem: Item?
    @NSManaged public var tostore: NSSet?

}

// MARK: Generated accessors for tostore
extension Image {

    @objc(addTostoreObject:)
    @NSManaged public func addToTostore(_ value: Store)

    @objc(removeTostoreObject:)
    @NSManaged public func removeFromTostore(_ value: Store)

    @objc(addTostore:)
    @NSManaged public func addToTostore(_ values: NSSet)

    @objc(removeTostore:)
    @NSManaged public func removeFromTostore(_ values: NSSet)

}
