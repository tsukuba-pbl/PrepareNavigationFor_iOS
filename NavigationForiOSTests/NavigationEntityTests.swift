//
//  NavigationEntityTests.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/23.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import NavigationForiOS

class NavigationEntityTests: XCTestCase {
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

        navigations.addNavigationPoint(route_id: 4, navigation_text: "turn left", expectedBeacons: beacons1, isStart: 0, isGoal: 0, isCrossroad: 1, isRoad: 0, rotate_degree: 90)
        
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
    
    func testGetUsingUUID_成功するとき黒いビーコンの識別子() {
        let uuidlist = navigations.getUUIDList()
        let retval = uuidlist.contains("12345678-1234-1234-1234-123456789ABC")
        XCTAssertTrue(retval)
    }
    
    func testGetUsingUUID_失敗するとき() {
        let uuidlist = navigations.getUUIDList()
        let retval = uuidlist.contains("B9407F30-F5F8-466E-AFF9-25556B57FE6B")
        XCTAssertFalse(retval)
    }
    
    func testGetNavigationText(){
        let retval1 = navigations.getNavigationText(route_id: 1)
        XCTAssertEqual(retval1, "Start")
        let retval2 = navigations.getNavigationText(route_id: 3)
        XCTAssertEqual(retval2, "straight")
    }
    
    func testGetRouteExpectedBeacons(){
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
        var beacons = [[BeaconRssi]]()
        beacons.append(beaconThresholdList1)
        beacons.append(beaconThresholdList2)
        beacons.append(beaconThresholdList3)
        
        let retval = navigations.getRouteExpectedBeacons(route_id: 1)
        
        for (i, element1) in beacons.enumerated(){
            for (j, element2) in element1.enumerated(){
                XCTAssertEqual(retval[i][j].minor_id, element2.minor_id)
                XCTAssertEqual(retval[i][j].rssi, element2.rssi)
            }
        }

    }
    
    func testGetNavigationDegree(){
        XCTAssertEqual(navigations.getNavigationDegree(route_id: 2), -90)
        XCTAssertEqual(navigations.getNavigationDegree(route_id: 4), 90)
    }
    
    func testGetMinorList(){
        let expectedVal = [1,2,3,4,5,6,7,8,9]
        XCTAssertEqual(navigations.getMinorIdList(), expectedVal)
    }
    
    func testIsStart() {
        XCTAssertEqual(navigations.isStart(routeId: 1), true)
        XCTAssertEqual(navigations.isStart(routeId: 2), false)
    }
    
    func testIsGoal() {
        XCTAssertEqual(navigations.isGoal(routeId: 6), true)
        XCTAssertEqual(navigations.isGoal(routeId: 2), false)
    }
    
    func testIsRoad() {
        XCTAssertEqual(navigations.isRoad(routeId: 3), true)
        XCTAssertEqual(navigations.isRoad(routeId: 4), false)
    }
    
    func testIsCrossroad() {
        XCTAssertEqual(navigations.isCrossroad(routeId: 4), true)
        XCTAssertEqual(navigations.isCrossroad(routeId: 3), false)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
