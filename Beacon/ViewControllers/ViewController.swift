//
//  ViewController.swift
//  Beacon
//
//  Created by user1 on 26.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EILIndoorLocationManagerDelegate {

    let locationManager = EILIndoorLocationManager()
    var location: EILLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchLocationRequest = EILRequestFetchLocation(locationIdentifier: "my-kitchen")
        fetchLocationRequest.sendRequest { (location, error) in
            if location != nil {
                self.location = location!
            } else {
                print("can't fetch location: \(error)")
            }
        }
        
    }

}

