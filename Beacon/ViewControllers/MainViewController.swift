//
//  MainViewController.swift
//  Beacon
//
//  Created by user1 on 26.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, EILIndoorLocationManagerDelegate {

    @IBOutlet weak var locationView: EILIndoorLocationView!
    
    let locationManager = EILIndoorLocationManager()
    var location: EILLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ultraLightGrey
        
        locationManager.delegate = self
        ESTConfig.setupAppID("<App ID>", andAppToken: "<App Token>")

        let fetchLocationRequest = EILRequestFetchLocation(locationIdentifier: "beacons room")
        fetchLocationRequest.sendRequest { (location, error) in
            if location != nil {
                self.location = location!
            } else {
                print("can't fetch location: \(error)")
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.stopPositionUpdates()
    }

}

