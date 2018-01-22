//
//  CalendarModel.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import Foundation

enum PadTpe: Int {
    case Unknown = -1
    case Launch = 0
    case Landing = 1
}

enum ToBeDetermined: Int {
    case Unknown = -1
    case Certain = 0
    case Uncertain = 1
}

enum Status: Int {
    case Unknown = -1
    case Green = 1
    case Red = 2
    case Success = 3
    case Failed = 4
}

struct CalendarItem: Codable {
    let id: Int
    let name: String
    let net: String
    let tbdtime: Int
    let tbddate: Int
}

struct PadItem: Codable {
    let id: Int
    let name: String
    let padType: Int    
    
}

struct LaunchCalendar: Codable {
    let offset: Int
    let count: Int
    let total: Int
    let launches: [CalendarItem]
}
