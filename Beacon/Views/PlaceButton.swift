//
//  PlaceButton.swift
//  Beacon
//
//  Created by user1 on 30.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class PlaceButton: UIButton {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            customizeButton()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            customizeButton()
        }
        
        private func customizeButton() {
            titleLabel?.removeFromSuperview()
            layer.cornerRadius = 0.5 * bounds.size.width
            setImage(UIImage(named: "placeButton"), for: .normal)
            imageView?.clipsToBounds = false
        }
}
