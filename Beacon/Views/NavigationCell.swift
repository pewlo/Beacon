//
//  NavigationCell.swift
//  Beacon
//
//  Created by user1 on 27.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class NavigationCell: UITableViewCell {
    
    @IBOutlet weak var placeText: UILabel!
    @IBAction func goButton(_ sender: UIButton) {
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
