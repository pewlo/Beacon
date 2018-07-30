//
//  Constants.swift
//  Beacon
//
//  Created by user1 on 27/07/2018.
//  Copyright © 2018 user1. All rights reserved.
//

struct CellIdentifiers {
    static let MenuCell = "menuCell"
    static let NavigationCell = "NavigationCell"
}

struct ButtonName {
    static let menuButton = "menuButton"
    static let placeButton = "placeButton"
}

enum NotificationTitle: String {
    case letOffice = "You left the office :("
    case hello = "Hello again :)"
    case kitchen = "Welcome to kitchen"
    case floor14 = "Welcome to floor 14"
    
}

enum NotificationDesc: String {
    case leftOffice = "We miss you already…"
    case hello = "Welcome back at the office"
    case kitchen = "You can try coffee, tea or just water :)"
    case floor14 = "You can find mail room and other intresting places"
}

enum Bullet: String {
    case dot = "•"
}


