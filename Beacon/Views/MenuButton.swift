//
//  MenuButton.swift
//  Beacon
//
//  Created by user1 on 27/07/2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class MenuButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeButton()
    }
    
    private func customizeButton() {
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
        setImage(UIImage(named: "menuButton"), for: .normal)
    }
}
