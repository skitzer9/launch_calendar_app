//
//  CalendarModel.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import Foundation

struct CalendarItem: Codable {
    let id: Int
    let name: String
    let net: String
    let tbdtime: Int
    let tbddate: Int
}
struct LaunchCalendar: Codable {
    let offset: Int
    let count: Int
    let total: Int
    let launches: [CalendarItem]
}
