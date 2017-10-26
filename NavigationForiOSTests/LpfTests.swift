////
////  LpfTests.swift
////  NavigationForiOS
////
////  Created by ともひろ on 2017/09/05.
////  Copyright © 2017年 UmeSystems. All rights reserved.
////
//
//import XCTest
//@testable import PrepareNavigationForiOS
//
//class LpfTests: XCTestCase {
//    let lpf = Lpf()
//    let navigations = NavigationEntity()
//    
//    override func setUp() {
//        super.setUp()
//        
//        //ポイント1
//        var beaconThresholdList1: Array<BeaconThreshold>! = []
//        beaconThresholdList1.append(BeaconThreshold(minor_id: 1, threshold: -70))
//        beaconThresholdList1.append(BeaconThreshold(minor_id: 2, threshold: -75))
//        beaconThresholdList1.append(BeaconThreshold(minor_id: 3, threshold: -80))
//        navigations.addNavigationPoint(route_id: 1, navigation_text: "Start", expectedBeacons: beaconThresholdList1)
//        //ポイント2
//        var beaconThresholdList2: Array<BeaconThreshold>! = []
//        beaconThresholdList2.append(BeaconThreshold(minor_id: 4, threshold: -70))
//        beaconThresholdList2.append(BeaconThreshold(minor_id: 5, threshold: -75))
//        beaconThresholdList2.append(BeaconThreshold(minor_id: 6, threshold: -80))
//        navigations.addNavigationPoint(route_id: 2, navigation_text: "turn right", expectedBeacons: beaconThresholdList2)
//        //ポイント3
//        var beaconThresholdList3: Array<BeaconThreshold>! = []
//        beaconThresholdList3.append(BeaconThreshold(minor_id: 7, threshold: -70))
//        beaconThresholdList3.append(BeaconThreshold(minor_id: 8, threshold: -75))
//        beaconThresholdList3.append(BeaconThreshold(minor_id: 9, threshold: -80))
//        navigations.addNavigationPoint(route_id: 3, navigation_text: "turn left", expectedBeacons: beaconThresholdList3)
//        //ポイント4
//        var beaconThresholdList4: Array<BeaconThreshold>! = []
//        beaconThresholdList4.append(BeaconThreshold(minor_id: 10, threshold: -70))
//        beaconThresholdList4.append(BeaconThreshold(minor_id: 11, threshold: -75))
//        beaconThresholdList4.append(BeaconThreshold(minor_id: 12, threshold: -80))
//        navigations.addNavigationPoint(route_id: 4, navigation_text: "Goal", expectedBeacons: beaconThresholdList4)
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testGetCurrentPoint_ビーコンの値が初期値の場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -100, 2: -100, 3:-100, 4:-100, 5:-100, 6:-100, 7:-100, 8:-100, 9:-100, 10:-100, 11:-100, 12:-100]
//        XCTAssertEqual(self.lpf.getCurrentPoint(navigations: self.navigations, receivedBeaconsRssi: receivedBeaconsRssi), POINT.OTHER)
//    }
//    
//    func testGetCurrentPoint_ゴールでも交差点でもない場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -90, 2: -100, 3:-100, 4:-70, 5:-80, 6:-80, 7:-100, 8:-100, 9:-100, 10:-90, 11:-90, 12:-90]
//        XCTAssertEqual(self.lpf.getCurrentPoint(navigations: self.navigations, receivedBeaconsRssi: receivedBeaconsRssi), POINT.OTHER)
//    }
//    
//    func testGetCurrentPoint_交差点にいる場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -65, 2: -90, 3:-70, 4:-100, 5:-100, 6:-100, 7:-100, 8:-100, 9:-100, 10:-100, 11:-100, 12:-100]
//        XCTAssertEqual(self.lpf.getCurrentPoint(navigations: self.navigations, receivedBeaconsRssi: receivedBeaconsRssi), POINT.CROSSROAD)
//    }
//    
//    func testGetCurrentPoint_ゴールにいる場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -100, 2: -100, 3:-100, 4:-100, 5:-100, 6:-100, 7:-100, 8:-100, 9:-100, 10:-75, 11:-90, 12:-75]
//        XCTAssertEqual(self.lpf.getCurrentPoint(navigations: self.navigations, receivedBeaconsRssi: receivedBeaconsRssi), POINT.GOAL)
//    }
//    
//    func testIsOnNavigationPoint_成功する場合1() {
//        let rssi:Int! = -75
//        let threshold:Int! = -80
//        XCTAssertTrue(self.lpf.isOnNavigationPoint(RSSI: rssi, threshold: threshold))
//
//    }
//    
//    func testIsOnNavigationPoint_成功する場合2(){
//        let rssi:Int! = -70
//        let threshold:Int! = -75
//        XCTAssertTrue(self.lpf.isOnNavigationPoint(RSSI: rssi, threshold: threshold))
//    }
//    
//    
//    func testIsOnNavigationPoint_ビーコンがない場合(){
//        let rssi:Int! = -100 // ビーコンが取得できない場合の初期値が-100
//        let threshold:Int! = -75
//        XCTAssertFalse(self.lpf.isOnNavigationPoint(RSSI: rssi, threshold: threshold))
//    }
//    
//    func testGetMaxRssiMinorId_ビーコンの値が初期値の場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -100, 2: -100, 3:-100]
//        XCTAssertEqual(receivedBeaconsRssi[self.lpf.getMaxRssiMinorId(receivedBeaconsRssi: receivedBeaconsRssi)], -100)
//    }
//
//    
//    func testGetMaxRssiMinorId_計測できたビーコンの値が入っている場合() {
//        let receivedBeaconsRssi: Dictionary<Int, Int> = [1: -80, 2: -90, 3:-50]
//        XCTAssertEqual(self.lpf.getMaxRssiMinorId(receivedBeaconsRssi: receivedBeaconsRssi), 3)
//    }
//
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
//}

