//
//  MotionService.swift
//  NavigationForiOS
//
//  Created by Owner on 2017/08/31.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import CoreMotion

class MotionService {
    
    // create instance of MotionManager
    let motionManager = CMMotionManager()
    var direction_text: String
    var yaw:Int
    
    init() {
        // Initialize MotionManager
        self.motionManager.deviceMotionUpdateInterval = 0.05 // 20Hz
        self.yaw = 0
        self.direction_text = ""
    }
    
    func startMotionManager() {
        // Start motion data acquisition
        self.motionManager.startDeviceMotionUpdates( to: OperationQueue.current!, withHandler:{
            deviceManager, error in
            
            let attitude = deviceManager?.attitude
            self.yaw = Int((attitude?.yaw)! * 180.0 / Double.pi)
            
            //角度が正だったら左、負だったら右になる
            let direction: String
            if (self.yaw < 0) {
                direction = "右"
            }
            else {
                direction = "左"
            }
            
            self.direction_text = direction + "に" + String(self.yaw) + "度"
        })
    }
    
    func stopMotionManager() {
        self.motionManager.stopDeviceMotionUpdates()
    }
    
    func getYaw() -> Int {
        return self.yaw
    }
    
    func getDirection() -> String {
        return self.direction_text
    }
    
    func isDeviceMotionActive() -> Bool {
        return self.motionManager.isDeviceMotionActive
    }
}

