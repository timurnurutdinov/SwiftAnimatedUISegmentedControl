//
//  ViewController.swift
//  segmentedControlByView
//
//  Created by Nurutdinov Timur on 24/11/14.
//  Copyright (c) 2014 addleimb. All rights reserved.
//

import UIKit

let globalDuration = 0.41

class AnimatedViewController: UIViewController {
    
    var barSizeLeft = CGRect()
    var barSizeMid = CGRect()
    var barSizeRight = CGRect()
    
    var barLayer = CALayer()
    
    
    @IBOutlet var control: mySegmentedControl!
    @IBAction func myAction(sender: mySegmentedControl) {
        let options = UIViewAnimationOptions.CurveEaseInOut
        switch control.selectedSegmentIndex {
            case 0:
                self.animatePosition(self.barLayer, toRect: self.barSizeLeft)
                break;
            case 1:
                self.animatePosition(self.barLayer, toRect: self.barSizeMid)
                break;
            case 2:
                self.animatePosition(self.barLayer, toRect: self.barSizeRight)
                break;
            default:
                break;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var layer = CALayer()
        layer.frame = CGRectMake((self.view.frame.width - 306)/2, 100, 306, 30)
        layer.backgroundColor = UIColor(red:0.2, green:0.2, blue:0.2, alpha:1).CGColor
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: 20)
        layer.masksToBounds = true
        self.view.layer.addSublayer(layer)
        
        barSizeLeft = CGRect(x: 2, y: 2, width: 100, height: 26)
        barSizeMid = CGRect(x: 103, y: 2, width: 100, height: 26)
        barSizeRight = CGRect(x: 204, y: 2, width: 100, height: 26)
        barLayer.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1).CGColor
        barLayer.cornerRadius = 13.5
        barLayer.shadowOpacity = 0.5
        barLayer.shadowRadius = 2
        barLayer.masksToBounds = false
        barLayer.frame = barSizeLeft
        layer.addSublayer(barLayer)
        layer.zPosition = -1;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func swiftOut() -> (CAMediaTimingFunction) {
        var animationCurve: CAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 1, 1.7, 0.22, 0.61)
        return animationCurve
    }
    
    func animatePosition(barLayer: CALayer, toRect: CGRect) {
        var animationPreset = CABasicAnimation()
        animationPreset.keyPath = "position.x"
        animationPreset.fromValue = barLayer.presentationLayer().position.x;
        animationPreset.toValue = toRect.origin.x + barLayer.frame.width/2
        var delta = abs(barLayer.presentationLayer().position.x - (toRect.origin.x + barLayer.frame.width/2))/(toRect.width*2)
        animationPreset.duration = 0.47 * Double(delta);
        animationPreset.timingFunction = swiftOut()
        animationPreset.fillMode = kCAFillModeForwards
        animationPreset.removedOnCompletion = false
        barLayer.addAnimation(animationPreset, forKey: "move")
    }


}

