//
//  MainViewController.swift
//  Beacon
//
//  Created by user1 on 26.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, EILIndoorLocationManagerDelegate {
    
    // MARK: - Outlets and Properties
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var map: EILIndoorLocationView!
    @IBOutlet weak var menuButton: MenuButton!
    
    var isMenuTableViewVisible = false
    
    // MARK: - Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ultraLightGrey
        
        menuTableView.register(MenuCell.self, forCellReuseIdentifier: CellIdentifiers.MenuCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuTableView.frame.origin.y += 500
    }
    
    // MARK: - Handling touch events

    @IBAction func menuButtonTapped(_ sender: Any) {
        if isMenuTableViewVisible {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.menuTableView.frame.origin.y += 500
            }, completion: nil)
            isMenuTableViewVisible = false
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.menuTableView.frame.origin.y -= 500
            }, completion: nil)
            isMenuTableViewVisible = true
        }
        
    }
}

