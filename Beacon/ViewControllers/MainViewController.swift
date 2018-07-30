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
    @IBOutlet weak var placeButton: PlaceButton!
    
    var previousButtonTag: Int? = nil
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    var isMenuTableViewVisible = false
    
    // MARK: - Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuTableView.frame.origin.y += 500
    }
    
    private func initialSetup() {
        view.backgroundColor = .ultraLightGrey
        
        menuTableView.register(UINib(nibName: CellIdentifiers.MenuCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.MenuCell)
        menuTableView.register(UINib(nibName: CellIdentifiers.NavigationCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.NavigationCell)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        getNotification()
    }
    
    // MARK: - Handling touch events
    
    @IBAction func tableButtonTapped(_ sender: UIButton){
        if isMenuTableViewVisible {
            switch sender.tag {
            case menuButton.tag, placeButton.tag:
                if sender.tag == previousButtonTag {
                    animate(menuTableView, isVisible: true) { _ in
                        self.previousButtonTag = nil
                        self.isMenuTableViewVisible = false
                    }
                    break
                } else {
                    animate(menuTableView, isVisible: true) { _ in
                        self.menuTableView.reloadData()
                        self.previousButtonTag = nil
                        self.isMenuTableViewVisible = false
                        self.animate(self.menuTableView, isVisible: false) { _ in
                            self.isMenuTableViewVisible = true
                            self.previousButtonTag = sender.tag
                        }
                    }
                    break
                }
            default:
                print("Error")
                
            }
        } else {
            previousButtonTag = sender.tag
            menuTableView.reloadData()
            animate(menuTableView, isVisible: false)
            isMenuTableViewVisible = true
        }
    }
    
    fileprivate func animate<T: UIView>(_ view: T, isVisible: Bool, completionHandler completion: ((Bool) -> ())? = nil ){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            if isVisible {
                view.frame.origin.y += 500
            } else {
                view.frame.origin.y -= 500
            }
            }, completion: completion)
    }

    // MARK: - Handling notifications
    
    func getNotification(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [ .alert, .sound, .badge]) { didAllow,  error in
        }
        
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(NotificationTitle.hello.rawValue, comment: "")
        content.body = NSLocalizedString(NotificationDesc.hello.rawValue, comment: "")
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: NotificationTitle.hello.rawValue, content: content, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if previousButtonTag == menuButton.tag {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MenuCell, for: indexPath) as! MenuCell
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.NavigationCell, for: indexPath) as! NavigationCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
