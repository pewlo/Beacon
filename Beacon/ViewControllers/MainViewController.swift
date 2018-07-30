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
    
    let menuTableData: [[String: String]] = [
        ["title": "Kitchen notifications",
         "description": "See all available drinks"],
        ["title": "Important people alert",
         "description": "See when for example CEO is nearby"],
        ["title": "See your friends",
         "description": "Toggle to see where your friends are"],
        ["title": "Work space notifications",
         "description": "Get notified about your work area"],
    ]
    
    // MARK: - Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ultraLightGrey
        
        menuTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.MenuCell)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        
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
                self.menuTableView.frame.origin.y += 450
            }, completion: nil)
            isMenuTableViewVisible = false
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.menuTableView.frame.origin.y -= 450
            }, completion: nil)
            isMenuTableViewVisible = true
        }
        
    }
    
    func getNotification(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [ .alert, .sound, .badge]) { didAllow,  error in
        }
        
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(NotificationTitle.hello.rawValue, comment: "")
        content.body = NSLocalizedString(NotificationDesc.hello.rawValue, comment: "")
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: NotificationTitle.hello.rawValue, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
    }
    
}

// MARK: -

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuTableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MenuCell, for: indexPath) as! MenuCell
        
        cell.titleLabel.text = (menuTableData[indexPath.section])["title"]
        cell.descriptionLabel.text = (menuTableData[indexPath.section])["description"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
}
