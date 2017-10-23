//
//  TestService.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/09.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

class TestService{
    static func isTesting() -> Bool {
        return NSClassFromString("XCTest") != nil
    }
}
