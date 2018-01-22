//
//  Parser.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import Foundation

class Parser: NSObject {
    //
    
    static func getLaunchList(jsonString: String?) -> Void {
        if jsonString != nil {
            print("String DATA: \(jsonString!)")
            getLaunchList(jsonData: jsonString!.data(using: .utf8));
        } else {
            NSLog("String is nil");
        }
    }
    
    static func getLaunchList(jsonData: Data?) -> [LaunchInfo]? {
        var cal: LaunchCalendar? = nil;
        
        if let data = jsonData {
            let decoder = JSONDecoder();
            cal = try! decoder.decode(LaunchCalendar.self, from: data);
        } else {
            NSLog("Error: Data is null!");
        }
        
        if (cal != nil) {
            var list = [LaunchInfo]()
            for item in (cal?.launches)! {
                let li = LaunchInfo.init(entry: item);
                list.append(li);
                li.printFields();
//                print("===========================")
//                print("ID:    \(item.id)")
//                print("Title: \(item.name)")
//                print("Date:  \(item.net)")
//                print("===========================")
            }
            return list;
        }
        
        return nil;
        
    }
}
