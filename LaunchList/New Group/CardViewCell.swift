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
            //cellContentView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0);
            cellContentView.backgroundColor = UIColor.clear;
            self.backgroundColor = UIColor.clear;
            
            
//            cellContentView.layer.cornerRadius = 5.0;
//            cellContentView.layer.borderWidth = 0.2;
//            cellContentView.layer.borderColor = UIColor.lightGray.cgColor;
//
//            cellContentView.clipsToBounds = true;
//            cellContentView.backgroundColor = UIColor.clear;
            //self.backgroundColor = UIColor.clear;
        }
    }
    @IBOutlet var cellBackgroundView: UIView! {
        didSet {
            NSLog("didSet - cellBackgroundView");
            //cellBackgroundView.backgroundColor = UIColor.clear;
            cellBackgroundView.layer.cornerRadius = 7.0;
            cellBackgroundView.backgroundColor = UIColor.white;
            cellBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor;
            cellBackgroundView.layer.shadowRadius = 7.0;
            cellBackgroundView.layer.shadowOpacity = 0.5;
            cellBackgroundView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5);
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
