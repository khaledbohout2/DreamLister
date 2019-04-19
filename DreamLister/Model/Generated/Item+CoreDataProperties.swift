//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var detailes: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    @NSManaged public var toimage: Image?
    @NSManaged public var toitemtype: ItemType?
    @NSManaged public var tostore: Store?

}
