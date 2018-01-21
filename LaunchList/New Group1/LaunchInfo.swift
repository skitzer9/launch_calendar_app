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
    private(set) var date: Date?
    private(set) var month: String? = "Nil"
    private(set) var day: String? = "XX"
    private(set) var location: String? = "Unknown"
    
    private override init() {
    }
    
    func printFields() -> Void {
        print("Class: LaunchInfo");
        print("==================================");
        print("Title:    \(title!)")
        print("Pad:      \(pad!)")
        print("Location: \(location!)")
        print("Month:    \(month!)")
        print("Day:      \(day!)")
        print("==================================");
    }
}
