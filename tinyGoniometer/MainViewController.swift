//
//  mainViewController.swift
//  tinyGoniometer
//
//  Created by Ryuichirou on 2015/07/16.
//  Copyright (c) 2015年 gokennya. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class MainViewController: UIViewController {
    
    @IBOutlet weak var angleLabel: UILabel!
    let motionManager: CMMotionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.deviceMotionUpdateInterval = 0.05
        
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
            deviceManager, error in
            
            var attitude: CMAttitude = deviceManager.attitude
            println(attitude.pitch*180.0/M_PI)
            self.angleLabel!.text = NSString(format: "%3.2f", attitude.pitch*180.0/M_PI) as String

        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



