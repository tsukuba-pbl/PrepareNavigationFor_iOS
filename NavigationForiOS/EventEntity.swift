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
    var date: String?
    var location: String?
    
    init(id: String, name: String, info: String, date: String, location: String) {
        self.id = id
        self.name = name
        self.info = info
        self.date = date
        self.location = location
    }
}
