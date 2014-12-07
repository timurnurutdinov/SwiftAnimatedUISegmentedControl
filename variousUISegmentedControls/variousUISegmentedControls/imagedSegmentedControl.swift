//
//  imagedSegmentedControl.swift
//  segmentedControlByImages
//
//  Created by Nurutdinov Timur on 30/11/14.
//  Copyright (c) 2014 addleimb. All rights reserved.
//

import Foundation
import UIKit

class ImagedSegmentedControl: UISegmentedControl {
    override init(items: [AnyObject]!) {
        super.init(items: items)
        createControl()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createControl()
    }
    
    func createControl() {
        setImagesForSegments()
        setTextAttributes()
    }
    
    func setImagesForSegments() {
        var selectedNone = UIImage(named: "selected-none.png")
        var selectedLeft = UIImage(named: "selected-left.png")
        var selectedRight = UIImage(named: "selected-right.png")
        
        var selected = UIImage(named: "selected.png")
        var normal = UIImage(named: "normal.png")
        
        self.setDividerImage(selectedNone, forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        self.setDividerImage(selectedLeft, forLeftSegmentState: UIControlState.Selected, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        self.setDividerImage(selectedRight, forLeftSegmentState: UIControlState.Normal, rightSegmentState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        
        self.setBackgroundImage(selected, forState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        self.setBackgroundImage(normal, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
        
        self.setContentPositionAdjustment(UIOffsetMake(8, 0), forSegmentType: UISegmentedControlSegment.Left, barMetrics: UIBarMetrics.Default)
        self.setContentPositionAdjustment(UIOffsetMake(-8, 0), forSegmentType: UISegmentedControlSegment.Right, barMetrics: UIBarMetrics.Default)
    }
    
    func setTextAttributes() {
        var normalStateAttributes = [NSForegroundColorAttributeName : UIColor(red:1, green:1, blue:1, alpha:1)]
        var selectedStateAttributes = [NSForegroundColorAttributeName : UIColor(red:0, green:0.75, blue:1, alpha:1)]
        
        self.setTitleTextAttributes(normalStateAttributes, forState: UIControlState.Normal)
        self.setTitleTextAttributes(selectedStateAttributes, forState: UIControlState.Selected)
    }
}
