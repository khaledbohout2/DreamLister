//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/8/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var StorePicker:UIPickerView!
    @IBOutlet weak var Titletextfield:CustomTextField!
    @IBOutlet weak var Pricetextfield:CustomTextField!
    @IBOutlet weak var Detailstextfield:CustomTextField!
    @IBOutlet weak var thumpimage: UIImageView!
    
    var Stores = [Store]()
    var itemtoedit:Item?
    var imagepicker:UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let topitem = self.navigationController?.navigationBar.topItem{
            topitem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        }
        StorePicker.delegate=self
        StorePicker.dataSource=self
       
        imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        
     //   let store = Store(context: context)
     //   store.name = "Amazon"
      //  let store2 = Store(context: context)
      //  store2.name = "Souq.com"
      //  let store3 = Store(context: context)
      //  store3.name = "Future Electronics"
      //  let store4 = Store(context: context)
       // store4.name = "Jumia"
       // let store5 = Store(context: context)
       // store5.name = "EgyMobiles"
       // let store6 = Store(context: context)
       // store6.name = "TeslaDealerShips"
        
        //ad.saveContext()
        
        //getstores()
        
        if itemtoedit != nil{
            loaditemdata()
        }

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = Stores[row]
        return store.name

    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Stores.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Update
    }
    
    func getstores(){
        let fetchrequest:NSFetchRequest<Store> = Store.fetchRequest()
        do{
        self.Stores = try  context.fetch(fetchrequest)
            StorePicker.reloadAllComponents()
        }
        catch{let err = error as NSError
            print(err)
        }
        
    }
    
    @IBAction func savebutton(_ sender: UIButton) {
        
        var item:Item!
        let picture = Image(context: context)
        picture.image = thumpimage.image
        
        
        
        if itemtoedit == nil{
        item = Item(context: context)
        }
        else{
            item = itemtoedit!
        }
        item.toimage = picture
        
        if let title = Titletextfield.text{
            item.title = title
        }
        
        if let price = Pricetextfield.text{
            item.price = (price as NSString).doubleValue
        }
        
        if let details = Detailstextfield.text{
            item.detailes = details
        }
        item.tostore = Stores[StorePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    func loaditemdata(){
        
        if let item = itemtoedit {
            
            Titletextfield.text = item.title
            Pricetextfield.text = "\(item.price)"
            Detailstextfield.text = item.detailes
            thumpimage.image = item.toimage?.image as? UIImage 
            
            if let store = item.tostore{
                var index = 0
                repeat {
                    print(Stores[index])
                    let s = Stores[index]
                    if s.name == store.name{
                        StorePicker.selectRow(index, inComponent: 0, animated: false)
                    }
                    index += 1
                }
                while index < Stores.count
               
                
            }
            

    }
    
    }


    @IBAction func deletepresserd(_ sender: UIBarButtonItem) {
        if itemtoedit != nil {
            context.delete(itemtoedit!)
            ad.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addimage(_ sender: UIButton) {
        
        present(imagepicker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage]as? UIImage{
            thumpimage.image = img
        }
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    

}
