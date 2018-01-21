//
//  ViewController.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import UIKit


class LaunchView: UITableViewController {
    
    private var tableData = [LaunchInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0);
        
        let data1 = LaunchInfo.Builder()
            .setTitle(title: "Falcon Heavy")
            .setPad(pad: "Launch Complex 39A")
            .setLocation(location: "Cape Canaveral, FL USA")
            .setMonth(month: "Feb")
            .setDay(day: "10")
            .build();
        
        let data2 = LaunchInfo.Builder()
            .setTitle(title: "Atlas V")
            .setPad(pad: "Space Launch Complex 41")
            .setLocation(location: "Cape Canaveral, FL USA")
            .setMonth(month: "Jun")
            .setDay(day: "23")
            .build();
        
        let data3 = LaunchInfo.Builder()
            .setTitle(title: "Delta IV")
            .setPad(pad: "Space Launch Complex 37B")
            .setLocation(location: "Cape Canaveral, FL USA")
            .setMonth(month: "Sep")
            .setDay(day: "02")
            .build();
        
        tableData.append(data1);
        tableData.append(data2);
        tableData.append(data3);
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCard", for: indexPath) as! CardViewCell;
        
        //cell.textLabel?.text = tableData[indexPath.row];
        
        let info = tableData[indexPath.row]
        cell.launchLabel.text = info.title;
        cell.monthLabel.text = info.month;
        cell.dayLabel.text = info.day;
        cell.padLabel.text = info.pad;
        cell.locationLabel.text = info.location;
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

