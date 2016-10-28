//
//  AddAdventurerViewController.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 10/21/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import UIKit
import CoreData

var characters = ["1","2","3","4","5", "6", "7"] //default images
var indexImage: Int? //index to display on the tableView
class AddAdventurerViewController: UIViewController, UITextFieldDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var classField: UITextField!
    @IBOutlet var collectionField: UICollectionView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameField.delegate = self
        classField.delegate = self
        collectionField.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //viewdatasource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return characters.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImagesCollectionViewCell", forIndexPath: indexPath) as! ImagesCollectionViewCell
        
        cell.character.image = UIImage(named: characters[indexPath.row]) //populate collectionView
        
        return cell
        
        
    }
    
   
    //when cell is selected in collectionView, adds a gray border to the cell and saves the index
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        indexImage = indexPath.row + 1
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    //switching to another cell, removes the border
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath){
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        cell.layer.borderWidth = 0.0
        
    }
    
    //size of the viewLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = self.view.frame.size.width / 4
        let height = self.view.frame.size.height / 5
        return CGSizeMake(width,height)
    }
    
    //save info

    @IBAction func saveButton(sender: UIButton) {
        
        //if either of the texfields are empty it display an alert
        if !nameField.text!.isEmpty && !classField.text!.isEmpty {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            let entity = NSEntityDescription.entityForName("Adventurer", inManagedObjectContext: managedContext)
            let adventurer = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            //saves info to CoreData.
            adventurer.setValue(nameField.text, forKey: "name")
            adventurer.setValue(classField.text, forKey: "classType")
            adventurer.setValue(3.55, forKey: "attack") //change to random with a function
            adventurer.setValue(105, forKey: "hp") //change to random with a function
            adventurer.setValue(1, forKey: "level")
            //case if no image is selected? random one?
            adventurer.setValue(indexImage, forKey: "image")
            
            
            do {
                try managedContext.save()
                adventurers.append(adventurer)
            } catch let error as NSError{
                print("Could not save \(error), \(error.userInfo)")
            }
            self.dismissViewControllerAnimated(true, completion: {})
            
        }else{ //pop up to show to tell the user to fill in both text fields
            let alert = UIAlertController(title: "Alert!", message: "Please fill in both text fields.", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Default) {(action:UIAlertAction) -> Void in
            }
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true, completion: nil)

        }
        
    }
    //cancel button.
    @IBAction func cancel(sender: UIButton){
         self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    
}
