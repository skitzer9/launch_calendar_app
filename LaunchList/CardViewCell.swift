//
//  CardViewCell.swift
//  LaunchList
//
//  Created by Jonathan Serrano Otero on 1/21/18.
//  Copyright © 2018 shaggy. All rights reserved.
//

import UIKit

class CardViewCell: UITableViewCell {
    @IBOutlet var cellContentView: UIView! {
        didSet {
            cellContentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0);
        }
    }
    @IBOutlet var cellBackgroundView: UIView! {
        didSet {
            NSLog("didSet - cellBackgroundView");
            cellBackgroundView.layer.cornerRadius = 5.0;
            cellBackgroundView.backgroundColor = UIColor.white
        }
    }
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var launchLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var padLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        NSLog("CardViewCell - init(coder)");
    }
}
