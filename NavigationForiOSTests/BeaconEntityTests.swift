//
//  BeaconEntityTests.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/30.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import NavigationForiOS

class BeaconEntityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializer1(){
        let beacon = BeaconEntity()
        XCTAssertEqual(beacon.minorId, -1)
        XCTAssertEqual(beacon.rssi, -100)
        XCTAssertEqual(beacon.uuid, "")
    }
    
    func testInitializer2(){
        let beacon = BeaconEntity(minorId: 2, rssi: -70)
        XCTAssertEqual(beacon.minorId, 2)
        XCTAssertEqual(beacon.rssi, -70)
        XCTAssertEqual(beacon.uuid, "")
    }
    
    func testInitializer3(){
        let beacon = BeaconEntity(minorId: 3, rssi: -65, uuid: "12345678-1234-1234-1234-123456789ABC")
        XCTAssertEqual(beacon.minorId, 3)
        XCTAssertEqual(beacon.rssi, -65)
        XCTAssertEqual(beacon.uuid, "12345678-1234-1234-1234-123456789ABC")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
