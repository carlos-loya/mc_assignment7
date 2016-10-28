//
//  QuestViewController.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 10/21/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import UIKit

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
    
    var advenTimer = NSTimer()
    var enemyTimer = NSTimer()
    
    //var counterm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.text = tempName
        type.text = tempType
        attack.text = tempAtt
        hpMax.text = tempHP
        level.text = tempLvl
        questImage.image = tempImg
        log.text = "Oh boy! Here I go questing again!"
        
        
        advenTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(heroAtt), userInfo: nil, repeats: true)
        enemyTimer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: #selector(heroAtt), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func endQuest(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    func heroAtt() {
        let attack = Double(tempAtt!)
        let currentHP = Double(hpMax.text!)
        let damage = (attack! * 4) - currentHP!
        
        hpMax.text = "\(damage)"
        
    }
    
    func enemtAtt(){
        
    }
    
    
}
