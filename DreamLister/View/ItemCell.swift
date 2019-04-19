//
//  ItemCell.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumbimg: UIImageView!
    @IBOutlet weak var itemtitlelbl: UILabel!
    @IBOutlet weak var itempricelbl: UILabel!
    @IBOutlet weak var itemdetaileslbl: UILabel!
    
    func configureCell(item:Item){
        itemtitlelbl.text = item.title
        itempricelbl.text = "$\(item.price)"
        itemdetaileslbl.text = item.detailes
        thumbimg.image = item.toimage?.image as? UIImage
        
    }
    

}
