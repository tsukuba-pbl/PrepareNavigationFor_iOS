//
//  PedometerServiceTests.swift
//  NavigationForiOS
//
//  Created by Owner on 2017/08/26.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import NavigationForiOS

class PedometerServiceTests: XCTestCase {
    
    let pedometerservice = PedometerService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsStepEqual0_初期歩数が0であること() {
        XCTAssertEqual(self.pedometerservice.get_steps(), 0)
    }
    
    func testIsStopPedometer_歩数計を止めたら歩数が0になっていること() {
        self.pedometerservice.steps = 30
        self.pedometerservice.stop_pedometer()
        XCTAssertEqual(self.pedometerservice.steps, 0)
    }
    
}
