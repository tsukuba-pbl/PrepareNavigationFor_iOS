//
//  MagneticSensorServiceTests.swift
//  NavigationForiOS
//
//  Created by Owner on 2017/09/22.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import PrepareNavigationForiOS

class MagneticSensorServiceTests: XCTestCase {
    

    let magneticsensorservice = MagneticSensorSerivce()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func initTests() {
        XCTAssertEqual(magneticsensorservice.magineticValue, 0.0)
    }
    
    func getMagneticDirectionTests() {
        magneticsensorservice.magineticValue = 3.0
        XCTAssertEqual(magneticsensorservice.getMagneticDirection(), 3.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
