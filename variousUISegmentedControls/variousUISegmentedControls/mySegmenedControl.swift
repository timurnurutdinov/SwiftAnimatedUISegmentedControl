//
//  mySegmenedControl.swift
//  segmentedControlByView
//
//  Created by Nurutdinov Timur on 24/11/14.
//  Copyright (c) 2014 addleimb. All rights reserved.
//

import Foundation
import UIKit

class mySegmentedControl: UISegmentedControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildView()
    }
    
    
    
    func buildView() {
        var normalStateAttributes = [NSForegroundColorAttributeName : UIColor(red:1, green:1, blue:1, alpha:1)]
        var selectedStateAttributes = [NSForegroundColorAttributeName : UIColor(red:0, green:0.75, blue:1, alpha:1)]
        
        self.setTitleTextAttributes(normalStateAttributes, forState: UIControlState.Normal)
        self.setTitleTextAttributes(selectedStateAttributes, forState: UIControlState.Selected)
        self.tintColor = UIColor(red:0.2, green:0.2, blue:0.2, alpha:1)
        
        
        self.tintColor = UIColor(red:0.2, green:0.2, blue:0.2, alpha:0)
        
        
        self.backgroundColor = UIColor(red:0.2, green:0.2, blue:0.2, alpha:0)
        self.layer.cornerRadius = 13.5

        
        self.insertSegmentWithTitle("Top rated", atIndex: 0, animated: true)
        self.insertSegmentWithTitle("Latest", atIndex: 1, animated: true)
        self.insertSegmentWithTitle("Country", atIndex: 2, animated: true)
        self.selectedSegmentIndex = 0
    }
}

