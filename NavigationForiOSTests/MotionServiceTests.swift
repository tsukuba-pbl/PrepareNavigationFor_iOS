//
//  MotionServiceTests.swift
//  NavigationForiOS
//
//  Created by Owner on 2017/09/07.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import NavigationForiOS

class MotionServiceTests: XCTestCase {
    
    let motionservice = MotionService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetYaw() {
        self.motionservice.yaw = 30
        XCTAssertEqual(self.motionservice.getYaw(), 30)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
