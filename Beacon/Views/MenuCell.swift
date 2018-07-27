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
        setupSwitch()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupSwitch()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupSwitch() {
        menuSwitch.onTintColor = UIColor.lightBluePurple
        menuSwitch.thumbTintColor = UIColor.bluePurple
    }

}
