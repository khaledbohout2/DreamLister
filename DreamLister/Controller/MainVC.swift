//
//  MainVC.swift
//  DreamLister
//
//  Created by Khaled Bohout on 2/6/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {


    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var segmentedcontroller: UISegmentedControl!
    
    var controller : NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
        
        //generatedata()
        attemptFetch()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections?.count{
            return sections
        }
        return 0

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
            let sectioninfo = sections[section]
            return sectioninfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)as! ItemCell
        configurecell(cell: cell, indexpath: indexPath as NSIndexPath)
        return cell
        
    }
    func configurecell(cell:ItemCell,indexpath:NSIndexPath)
    {
        let item = controller.object(at: indexpath as IndexPath)
        cell.configureCell(item: item)
        
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects, objs.count > 0 {
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailsVC", sender: item)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailsVC" {
            if let destination = segue.destination as? ItemDetailsVC {
                if let item = sender as? Item{
                    destination.itemtoedit = item
                }
            }
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    
    func attemptFetch(){
        
        let fetchrequst : NSFetchRequest<Item> = Item.fetchRequest()
        let datesort = NSSortDescriptor(key: "created", ascending: false)
        let pricesort = NSSortDescriptor(key: "price", ascending: true)
        let titlesort = NSSortDescriptor(key: "title", ascending: true)
        
        if segmentedcontroller.selectedSegmentIndex == 0{
        fetchrequst.sortDescriptors = [datesort]
        }
        else if segmentedcontroller.selectedSegmentIndex == 1{
            fetchrequst.sortDescriptors = [pricesort]
        }
        else if segmentedcontroller.selectedSegmentIndex == 2 {
            fetchrequst.sortDescriptors = [titlesort]
        }
        
        let controller = NSFetchedResultsController(fetchRequest: fetchrequst, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
            
        }
        catch{ let err = error as NSError
            print(err)
            
        }
        
    }
    @IBAction func changesegment(_ sender: AnyObject) {
        attemptFetch()
        TableView.reloadData()
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        TableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        TableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                TableView.insertRows(at: [indexPath], with: .fade)
            }
            break

        case .delete:
            if let indexpath = indexPath {
                TableView.deleteRows(at: [indexpath], with: .fade)
            }
            break
        case .move:
            if let indexpath = indexPath {
                TableView.deleteRows(at: [indexpath], with: .fade)
            }
            if let indexPath = newIndexPath {
                TableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexpath = indexPath {
                let cell = TableView.cellForRow(at: indexpath)as! ItemCell
                configurecell(cell: cell, indexpath: indexpath as NSIndexPath)
            }
            break
        @unknown default:
            <#fatalError()#>
        }
    }
func generatedata(){
        
        let item = Item(context: context)
        item.title = "MacBokPro"
        item.price = 120000
        item.detailes = "any thing any thing any thing any thing any thing any thing any"
        
        let item4 = Item(context: context)
        item4.title = "MacBokPro"
        item4.price = 14000
        item4.detailes = "any thing any thing any thing any thing any thing any thing any"
        
        let item3 = Item(context: context)
        item3.title = "MacBokPro"
        item3.price = 15000
        item3.detailes = "any thing any thing any thing any thing any thing any thing any"
        
        let item2 = Item(context: context)
        item2.title = "MacBokPro"
        item2.price = 16000
        item2.detailes = "any thing any thing any thing any thing any thing any thing any"
        
        ad.saveContext()
    }

    


}

