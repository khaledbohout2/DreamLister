//
//  MaterialView.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit

private var materialkey = false

extension UIView {
    
    @IBInspectable var materialDesign : Bool{
        
        get{
            return materialkey
        }
        set{
            materialkey = newValue
            if materialkey == true{
                
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                 self.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 0.1).cgColor
            }
            else{
                
                self.layer.cornerRadius = 0.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
        }
    }



}
