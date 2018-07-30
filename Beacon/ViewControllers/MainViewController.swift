//
//  MainViewController.swift
//  Beacon
//
//  Created by user1 on 26.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController, EILIndoorLocationManagerDelegate {
    
    // MARK: - Outlets and Properties
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var map: EILIndoorLocationView!
    @IBOutlet weak var menuButton: MenuButton!
    
    let center = UNUserNotificationCenter.current()

    
    var isMenuTableViewVisible = false
    
    // MARK: - Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ultraLightGrey
        
        menuTableView.register(MenuCell.self, forCellReuseIdentifier: CellIdentifiers.MenuCellIdentifier)
        
        getNotification()
    
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
    
    func getNotification(){
        
        center.requestAuthorization(options: [.alert, .badge], completionHandler: {didAllow, error in
        })
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(NotificationTitle.hello.rawValue, comment: "")
        content.body = NSLocalizedString(NotificationDesc.hello.rawValue, comment: "")
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: NotificationTitle.hello.rawValue, content: content, trigger: trigger)
    
        center.add(request, withCompletionHandler: nil)
    }
}

