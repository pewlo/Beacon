//
//  MenuCell.swift
//  Beacon
//
//  Created by user1 on 27/07/2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var menuSwitch: UISwitch!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupSwitch()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupSwitch() {
        // On state
        menuSwitch.onTintColor = .lightBluePurple
        menuSwitch.thumbTintColor = .bluePurple
        
        // Off state
        menuSwitch.tintColor = .lightBluePurple
    }
    
}
