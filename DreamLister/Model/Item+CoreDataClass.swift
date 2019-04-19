//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        self.created = NSDate()
    }
  

}
