//
//  Enemy.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 11/3/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import Foundation


class Enemy {
    
    var enemyHP = 0.0
    var enemyAtt = 0.0
    
    
    init(){
        
        self.enemyAtt = Double(arc4random())/Double(UInt32.max)*3 + 2
        self.enemyHP = Double(arc4random_uniform(61) + 50)
    }
    
    
}
