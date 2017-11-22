//
//  EventEntity.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/10/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

class EventEntity {
    var id: String?
    var name: String?
    var info: String?
    var startDate: String?
    var endDate: String?
    var location: String?
    
    init(id: String, name: String, info: String, startDate: String, endDate: String, location: String) {
        self.id = id
        self.name = name
        self.info = info
        self.startDate = startDate
        self.endDate = endDate
        self.location = location
    }
}
