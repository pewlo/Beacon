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
        
        setupConstraints()
    }
    
    private func customizeButton() {
        titleLabel?.removeFromSuperview()
        layer.cornerRadius = 0.5 * bounds.size.width
        setImage(UIImage(named: ButtonName.menuButton), for: .normal)
        imageView?.clipsToBounds = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let leftAnchor = imageView?.leftAnchor.constraint(equalTo: self.leftAnchor)
        let rightAnchor = imageView?.rightAnchor.constraint(equalTo: self.rightAnchor)
        let topAnchor = imageView?.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomAnchor = imageView?.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        NSLayoutConstraint.activate([leftAnchor!, rightAnchor!, topAnchor!, bottomAnchor!])
    }
}
