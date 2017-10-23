//
//  beaconManagerTests.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/20.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import NavigationForiOS

class BeaconManagerTests: XCTestCase {
    let beaconManager = BeaconManager()
    let navigations = NavigationEntity()
    
    override func setUp() {
        super.setUp()
        //ポイント1
        var beaconThresholdList1: [BeaconRssi] = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        var beaconThresholdList2: [BeaconRssi] = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        var beaconThresholdList3: [BeaconRssi] = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        var beacons1 = [[BeaconRssi]]()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        navigations.addNavigationPoint(route_id: 1, navigation_text: "Start", expectedBeacons: beacons1, isStart: 1, isGoal: 0, isCrossroad: 0, isRoad: 1, rotate_degree: 0)
        
        //ポイント2
        beaconThresholdList1 = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList2 = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList3 = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        beacons1.removeAll()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        navigations.addNavigationPoint(route_id: 2, navigation_text: "turn right", expectedBeacons: beacons1, isStart: 0, isGoal: 0, isCrossroad: 1, isRoad: 0, rotate_degree: -90)
        
        //ポイント3
        beaconThresholdList1 = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList2 = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList3 = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        beacons1.removeAll()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        navigations.addNavigationPoint(route_id: 3, navigation_text: "straight", expectedBeacons: beacons1, isStart: 0, isGoal: 0, isCrossroad: 0, isRoad: 1, rotate_degree: 0)
        
        //ポイント4
        beaconThresholdList1 = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList2 = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList3 = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        beacons1.removeAll()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        
        navigations.addNavigationPoint(route_id: 4, navigation_text: "turn left", expectedBeacons: beacons1, isStart: 0, isGoal: 0, isCrossroad: 0, isRoad: 1, rotate_degree: 90)
        
        //ポイント5
        beaconThresholdList1 = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList2 = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList3 = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        beacons1.removeAll()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        
        navigations.addNavigationPoint(route_id: 5, navigation_text: "straight", expectedBeacons: beacons1, isStart: 0, isGoal: 0, isCrossroad: 0, isRoad: 1, rotate_degree: 0)
        
        //ポイント6
        beaconThresholdList1 = []
        beaconThresholdList1.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList1.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList1.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList1.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList2 = []
        beaconThresholdList2.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList2.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList2.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList2.append(BeaconRssi(minor_id: 9, rssi: -80))
        beaconThresholdList3 = []
        beaconThresholdList3.append(BeaconRssi(minor_id: 1, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 2, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 3, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 4, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 5, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 6, rssi: -80))
        beaconThresholdList3.append(BeaconRssi(minor_id: 7, rssi: -70))
        beaconThresholdList3.append(BeaconRssi(minor_id: 8, rssi: -75))
        beaconThresholdList3.append(BeaconRssi(minor_id: 9, rssi: -80))
        beacons1.removeAll()
        beacons1.append(beaconThresholdList1)
        beacons1.append(beaconThresholdList2)
        beacons1.append(beaconThresholdList3)
        
        navigations.addNavigationPoint(route_id: 6, navigation_text: "Goal", expectedBeacons: beacons1, isStart: 0, isGoal: 1, isCrossroad: 1, isRoad: 0, rotate_degree: 0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testIsAvailableBeaconId_成功するとき(){
        for i in 1...navigations.getMinorIdList().count{
            let retval = beaconManager.isAvailableBeaconId(navigations: navigations, uuid: "12345678-1234-1234-1234-123456789ABC", minor_id: i)
            XCTAssertTrue(retval)
        }
    }
    
    func testIsAvailableBeaconId_失敗するとき1_UUIDが違う(){
        let retval = beaconManager.isAvailableBeaconId(navigations: navigations, uuid: "12345678-1234-1234-1234-123456789ABD", minor_id: 1)
        XCTAssertFalse(retval)
    }
    
    func testIsAvailableBeaconId_失敗するとき1_minorが違う(){
        let retval = beaconManager.isAvailableBeaconId(navigations: navigations, uuid: "12345678-1234-1234-1234-123456789ABC", minor_id: 20)
        XCTAssertFalse(retval)
    }

    
    func testInitBeaconRssiList(){
        XCTAssertEqual(navigations.getMinorIdList().count, 9)
        beaconManager.initBeaconRssiList(minor_id_list: navigations.getMinorIdList())
        for i in beaconManager.availableBeaconRssiList{
            XCTAssertEqual(i.value, -100)
        }
    }
    
    func testGetMaxRssiBeacon1(){
        beaconManager.initBeaconRssiList(minor_id_list: navigations.getMinorIdList())
        beaconManager.availableBeaconRssiList[1] = -74
        beaconManager.availableBeaconRssiList[2] = -100
        beaconManager.availableBeaconRssiList[3] = -80
        beaconManager.availableBeaconRssiList[4] = -65
        beaconManager.maxRssiBeaconMinorId = 4
        let retval = beaconManager.getMaxRssiBeacon()
        let maxRssiBeacon = retval.maxRssiBeacon
        XCTAssertEqual(retval.available, true)
        XCTAssertEqual(maxRssiBeacon.minorId, 4)
        XCTAssertEqual(maxRssiBeacon.rssi, -65)
    }
    
    func testGetMaxRssiBeacon2(){
        beaconManager.initBeaconRssiList(minor_id_list: navigations.getMinorIdList())
        beaconManager.availableBeaconRssiList[1] = -100
        beaconManager.availableBeaconRssiList[2] = -100
        beaconManager.availableBeaconRssiList[3] = -100
        beaconManager.availableBeaconRssiList[4] = -100
        beaconManager.maxRssiBeaconMinorId = 1
        let retval = beaconManager.getMaxRssiBeacon()
        let maxRssiBeacon = retval.maxRssiBeacon
        XCTAssertEqual(retval.available, false)
        XCTAssertEqual(maxRssiBeacon.minorId, -1)
        XCTAssertEqual(maxRssiBeacon.rssi, -100)
    }
    
    func testLPF(){
        var current = Dictionary<Int, Int>()
        var old = Dictionary<Int, Int>()
        var expected = Dictionary<Int, Int>()
        
        //過去のRSSI値
        old[1] = -100
        old[2] = -100
        old[3] = -100
        //現在のRSSI値
        current[1] = -70
        current[2] = -80
        current[3] = -90
        // 期待値
        // フィルタ式： z(t+1) = a*z(t) + (1-a)*z(t-1)
        // a = 0.7
        expected[1] = -79
        expected[2] = -86
        expected[3] = -93
        
        let retval = beaconManager.LPF(currentBeaconRssiList: current, oldBeaconRssiList: old)
        for i in retval{
            XCTAssertEqual(expected[i.key], retval[i.key])
        }
    }
    
    func testGetReceivedBeaconsRssi(){
        XCTAssertTrue(beaconManager.getReceivedBeaconsRssi().isEmpty)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
