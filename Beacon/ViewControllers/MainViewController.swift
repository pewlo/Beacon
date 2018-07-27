//
//  MainViewController.swift
//  Beacon
//
//  Created by user1 on 26.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, EILIndoorLocationManagerDelegate {
    
    @IBOutlet weak var map: EILIndoorLocationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ultraLightGrey
        
        func drawObjectInBackground(){
            
        }
        
    }

}

