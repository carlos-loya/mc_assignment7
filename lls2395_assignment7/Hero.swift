//
//  Hero.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 11/4/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import Foundation

class Hero {
    
    var heroHP = 0.0
    var heroAtt = 0.0
    
    
    init(){
        
        self.heroAtt = Double(arc4random())/Double(UInt32.max)*3 + 2
        self.heroHP = Double(arc4random_uniform(61) + 50)
    }
    
}
