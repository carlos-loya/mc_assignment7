//
//  Adventurer.swift
//  cal3388_lls2395_assignment7
//
//  Created by Carlos Loya on 10/21/16.
//  Copyright © 2016 Luis Sanchez. All rights reserved.
//

import UIKit

class AdventurerViewCell: UITableViewCell {
    
    @IBOutlet weak var adventurerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet var attackScore: UILabel!
    @IBOutlet var hpScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
