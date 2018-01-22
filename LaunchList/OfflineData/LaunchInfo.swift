//
//  LaunchInfo.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import Foundation


class LaunchInfo: NSObject {
    
    class Builder {
        private var launchInfo: LaunchInfo?
        init() {
            launchInfo = LaunchInfo();
        }
        
        
        func setTitle(title: String?) -> Builder {
            launchInfo?.title = title;
            return self;
        }
        
        func setMonth(month: String?) -> Builder {
            launchInfo?.month = month;
            return self;
        }
        
        func setDay(day: String?) -> Builder {
            launchInfo?.day = day;
            return self;
        }
        
        func setPad(pad: String?) -> Builder {
            launchInfo?.pad = pad;
            return self;
        }
        
        func setLocation(location: String?) -> Builder {
            launchInfo?.location = location;
            return self;
        }
        
        func build() -> LaunchInfo {
            return launchInfo!;
        }
        
    }
    private(set) var title: String! = "Title goes here"
    private(set) var pad: String! = "Unknown"
    private(set) var date: Date! = nil
    private(set) var net: String! = "Unknown"
    private(set) var month: String? = "Nil"
    private(set) var day: String? = "XX"
    private(set) var location: String! = "Unknown"
    private(set) var id: Int = -1
    private(set) var rocket: String! = "Unknown"
    private(set) var mission: String! = "Unknown"
    private(set) var tbdTime: ToBeDetermined = .Unknown
    private(set) var tbdDate: ToBeDetermined = .Unknown
    
    private override init() {}
    
    init(entry: CalendarItem) {
        super.init();
        net = entry.net;
        title = entry.name
        let splitTitle = title.components(separatedBy: " | ");
        rocket = (splitTitle.count == 2) ? splitTitle[0] : "Unknown";
        mission = (splitTitle.count == 2) ? splitTitle[1] : "Unknown";
        id = entry.id
        day = getDayFromString(date: net);
        month = getMonthFromString(date: net);
    }
    
    func printFields() -> Void {
        print("Class: LaunchInfo");
        print("==================================");
        print("ID:       \(id)");
        print("Title:    \(title!)");
        print("Rocket:   \(rocket!)");
        print("Mission:  \(mission!)");
        print("Pad:      \(pad!)");
        print("Location: \(location!)");
        print("Date:     \(date)");
        print("Month:    \(month!)");
        print("Day:      \(day!)");
        print("NET:      \(net!)");
        print("==================================");
    }
    
    
    private func getDayFromString(date: String) -> String {
        let split = date.components(separatedBy: " ");
        var day = split[1];
        let range = day.startIndex..<day.index(before: day.endIndex)
        
        day = String(day[range])
        return day;
    }
    
    private func getMonthFromString(date: String) -> String {
        let split = date.components(separatedBy: " ");
        var month = split[0];
        let range = month.startIndex..<month.index(month.startIndex, offsetBy: 3);
        
        month = String(month[range])
        return month;
    }
    
    private func getDateFromString(stringDate: String) -> Date! {
        
        return nil;
    }
}

