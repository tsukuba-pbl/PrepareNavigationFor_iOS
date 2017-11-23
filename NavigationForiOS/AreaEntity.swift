//
//  AreaEntity.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/20.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

class AreaEntity: NSObject{
    public let routeId :Int
    public let navigation : String
    public let isStart : Int
    public let isGoal : Int
    public let isCrossroad : Int
    public let isRoad : Int
    public let rotateDegree : Int
    public let steps : Int
    public var beacons :Array<Dictionary<Int, Int>>
    
    init(routeId: Int, navigation: String, isStart: Int, isGoal: Int, isCrossroad: Int, isRoad: Int, rotateDegree: Int, steps: Int, beacons: Array<Dictionary<Int, Int>>){
        self.routeId = routeId
        self.navigation = navigation
        self.isStart = isStart
        self.isGoal = isGoal
        self.isCrossroad = isCrossroad
        self.isRoad = isRoad
        self.rotateDegree = rotateDegree
        self.steps = steps
        self.beacons = beacons
    }
    
}
