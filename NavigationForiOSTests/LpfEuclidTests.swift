////
////  LpfEuclidTests.swift
////  NavigationForiOS
////
////  Created by みなじゅん on 2017/09/06.
////  Copyright © 2017年 UmeSystems. All rights reserved.
////
//
//import XCTest
//@testable import NavigationForiOS
//
//class LpfEuclidTests: XCTestCase {
//    let lpfEuclid = LpfEuclid()
//    
//    override func setUp() {
//        super.setUp()
//
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testGetBeaconDist(){
//        //小数点第一位まで値が同じかをテストする
//        XCTAssertEqual(round(lpfEuclid.getBeaconDist(rssi: -75)*10.0)/10.0, 1.0)
//        XCTAssertEqual(round(lpfEuclid.getBeaconDist(rssi: -80)*10.0)/10.0, 1.8)
//    }
//    
//    func testGetEuclidResult_実際とビーコンの差分がない場合(){
//        let receivedBeaconRssiList = [1: -80, 2: -70, 3: -90, 4: -80]
//        let expectedBeaconRssiList = [1: -80, 2: -70, 3: -90, 4: -80]
//        XCTAssertEqual(lpfEuclid.getEuclidResult(receivedBeaconRssiList: receivedBeaconRssiList, expectedBeaconRssiList: expectedBeaconRssiList), 0.0)
//    }
//    
//    func testGetEuclidResult_実際とビーコンの差分がある場合(){
//        let receivedBeaconRssiList = [1: -80, 2: -70, 3: -95, 4: -80]
//        let expectedBeaconRssiList = [1: -90, 2: -95, 3: -90, 4: -70]
//        XCTAssertEqual(lpfEuclid.getEuclidResult(receivedBeaconRssiList: receivedBeaconRssiList, expectedBeaconRssiList: expectedBeaconRssiList), 29.15)
//    }
//    
//    func testGetEuclidResult_実際とビーコンの差分がある場合_数違う版(){
//        let receivedBeaconRssiList = [1: -80, 2: -70, 3: -95, 4: -80, 5: -100, 6: -80]
//        let expectedBeaconRssiList = [1: -90, 2: -95, 3: -90, 4: -70]
//        XCTAssertEqual(lpfEuclid.getEuclidResult(receivedBeaconRssiList: receivedBeaconRssiList, expectedBeaconRssiList: expectedBeaconRssiList), 29.15)
//    }
//    
//    func testGetMaxRssiMinorId() {
//        XCTAssertEqual(self.lpfEuclid.getMaxRssiMinorId(receivedBeaconsRssi: [1: -70, 2: -60]), 2)
//    }
//    
//    func testGetExpectedBeaconList() {
//        let navigations: NavigationEntity = NavigationEntity()
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
//        
//        XCTAssertEqual(self.lpfEuclid.getExpectedBeaconList(navigations: navigations, routeId: 2), [4: -70, 5: -75, 6: -80])
//        XCTAssertNotEqual(self.lpfEuclid.getExpectedBeaconList(navigations: navigations, routeId: 3), [4: -70, 5: -75, 6: -80])
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
//}
