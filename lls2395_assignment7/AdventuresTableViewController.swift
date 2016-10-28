//
//  ViewController.swift
//  lls2395_assignment7
//
//  Created by Luis Sanchez on 10/21/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import UIKit
import CoreData

var adventurers = [NSManagedObject]()

class AdventuresTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows

        return adventurers.count
    }
    
    //populate cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "AdventurerViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AdventurerViewCell
        
        cell.nameLabel.text = adventurers[indexPath.row].valueForKey("name") as? String
        cell.type.text = adventurers[indexPath.row].valueForKey("classType") as? String
        cell.attackScore.text = String(adventurers[indexPath.row].valueForKey("attack")!)
        cell.hpScore.text = String(adventurers[indexPath.row].valueForKey("hp")!)
        cell.levelLabel.text = String(adventurers[indexPath.row].valueForKey("level")!)
        cell.adventurerImage.image = UIImage(named: String(adventurers[indexPath.row].valueForKey("image")!))
        
        
        return cell
    }
    
    //needs it
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext =  appDelegate.managedObjectContext
        	
        let fetchRequest = NSFetchRequest(entityName: "Adventurer")
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            adventurers = results as! [NSManagedObject]
        } catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        //reload table after closing the viewcontroller
       
        self.tableView.reloadData()
    }
    
    //delete row
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //is it completely deleting?
        if editingStyle == .Delete{
            adventurers.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "questSegue"{
            
            let contentViewController = segue.destinationViewController as! QuestViewController
            
            if let selectedCell = sender as? AdventurerViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedCell)!
                
                
                contentViewController.name.text = adventurers[indexPath.row].valueForKey("name") as? String
                contentViewController.type.text = adventurers[indexPath.row].valueForKey("classType") as? String
                contentViewController.attack.text = String(adventurers[indexPath.row].valueForKey("attack")!)
                contentViewController.hpMax.text = String(adventurers[indexPath.row].valueForKey("hp")!)
                contentViewController.level.text = String(adventurers[indexPath.row].valueForKey("level")!)
                contentViewController.questImage.image = UIImage(named: String(adventurers[indexPath.row].valueForKey("image")!))
                
            }
            
        }
            
    }

    
}

