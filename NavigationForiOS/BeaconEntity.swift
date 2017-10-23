//
//  BeaconEntity.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/30.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

class BeaconEntity{
    var minorId : Int!
    var rssi : Int!
    var uuid : String!
    
    init(){
        self.minorId = -1
        self.rssi = -100
        self.uuid = ""
    }
    
    init(minorId: Int, rssi: Int){
        self.minorId = minorId
        self.rssi = rssi
        self.uuid = ""
    }
    
    init(minorId: Int, rssi: Int, uuid: String){
        self.minorId = minorId
        self.rssi = rssi
        self.uuid = uuid
    }
}
