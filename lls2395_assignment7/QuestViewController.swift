//
//  QuestViewController.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 10/21/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import UIKit
import CoreData

class QuestViewController: UIViewController {
    
    
    @IBOutlet var questImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var attack: UILabel!
    @IBOutlet var hpMax: UILabel!
    @IBOutlet var hpCurrent: UILabel!
    @IBOutlet var level: UILabel!
    @IBOutlet var log: UITextView!
    
    
    
    var tempName: String?
    var tempType: String?
    var tempAtt: String?
    var tempHP: String?
    var tempLvl: String?
    var tempImg: UIImage?
    var questLog: String = ""
    var experience: Int = 0
    
    let e1 = Enemy()
    
    var advenTimer = NSTimer()
    var enemyTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.text = tempName
        type.text = tempType
        attack.text = tempAtt
        hpMax.text = tempHP
        hpCurrent.text = tempHP
        level.text = tempLvl
        questImage.image = tempImg
        questLog += "Oh boy! Here I go questing again!\n"
        log.text = questLog
        
        
        
        advenTimer = NSTimer.scheduledTimerWithTimeInterval(1.4, target: self, selector: #selector(QuestViewController.heroAtt(_:)), userInfo: e1, repeats: true)
        enemyTimer = NSTimer.scheduledTimerWithTimeInterval(3.5, target: self, selector: #selector(QuestViewController.eAtt(_:)), userInfo: e1, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func endQuest(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    // called for when the hero attacks
    func heroAtt(timer:NSTimer){
        
        // damage calulation
        let e1 = timer.userInfo as! Enemy
        let heroAtt = Double(tempAtt!)! * Double(arc4random_uniform(3)) + 20
        let remainingHP = e1.enemyHP - heroAtt
        
        
        questLog += "\(name.text!) attacks for \(heroAtt) damage!\n"
        
        // if the enemy is still alive
        if remainingHP > 0 {
            questLog += "The monster is waiting and has \(remainingHP) remaining...\n"
            e1.enemyHP = remainingHP
        }
            
        // if not
        else {
            questLog += "The monster is defeated!\n"
            questLog += "A new enemy appears!\n"
            e1.enemyHP += 60
            
            experience += (100 + Int(arc4random_uniform(100)))
            
            if experience > 400 {
                // DING
                // gratz
                
                experience = 0
                var tempLevel = Int(level.text!)!
                tempLevel += 1
                level.text = "\(tempLevel)"
                
                
            }
            
        }
        
        
        log.text = questLog
        
    }
    
    // enemy attack method called by the enemy timer
    func eAtt(timer:NSTimer){
        let e1 = timer.userInfo as! Enemy
    
        
        questLog += "The Monster attacks for \(e1.enemyAtt) damage!\n"
        
        let hpLeft = Double(hpCurrent.text!)! - e1.enemyAtt
        
        if hpLeft > 0 {
            hpCurrent.text = "\(hpLeft)"
        }
        else{
            hpCurrent.text = "0"
            questLog += "Oh no! You died!"
            timer.invalidate()
        }
        
        
        
        
    }

    
    
}
