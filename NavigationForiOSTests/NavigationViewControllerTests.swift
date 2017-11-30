//
//  NavigationViewControllerTests.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
@testable import PrepareNavigationForiOS

class NavigationViewControllerTests: XCTestCase {
    
//    var navigationViewController: NavigationViewController?
//    
//    override func setUp() {
//        super.setUp()
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        
//        self.navigationViewController = storyboard.instantiateViewController(withIdentifier: "NavigationStoryboard") as? NavigationForiOS.NavigationViewController
//        self.navigationViewController?.loadView()
//        self.navigationViewController?.viewDidLoad()
//        
//        self.navigationViewController?.navigations = NavigationEntity()
//        self.navigationViewController?.navigations?.addNavigationPoint(minor_id: 1, threshold: -80, navigation_text: "Start", type: 1)
//        self.navigationViewController?.navigations?.addNavigationPoint(minor_id: 2, threshold: -74, navigation_text: "turn right", type: 0)
//        self.navigationViewController?.navigations?.addNavigationPoint(minor_id: 3, threshold: -65, navigation_text: "turn left", type: 0)
//        self.navigationViewController?.navigations?.addNavigationPoint(minor_id: 4, threshold: -70, navigation_text: "Goal", type: 2)
//        self.navigationViewController?.navigations?.start_minor_id = 1
//        self.navigationViewController?.navigations?.goal_minor_id = 4
//
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//    }
//    
//    func testUpdateNavigation_ビーコンがない場合() {
//        self.navigationViewController?.updateNavigation()
//        XCTAssertEqual(self.navigationViewController?.uuid.text!, "none")
//        XCTAssertEqual(self.navigationViewController?.rssi.text!, "none")
//        XCTAssertEqual(self.navigationViewController?.minor.text!, "none")
//        XCTAssertEqual(self.navigationViewController?.navigation.text!, "none")
//    }
//    
//    func testUpdateNavigation_ビーコンがある場合() {
//        //テスト用にNavigationServiceのモックを作成
//        class MocBeaconService : BeaconService{
//            //getMaxRssiBeaconが指定した値を返すようにオーバーライド
//            public override func getMaxRssiBeacon() -> (flag: Bool, maxRssiBeacon: BeaconEntity) {
//                return (flag: true, maxRssiBeacon: BeaconEntity(minorId: 1, rssi:-74))
//            }
//        }
//        
//        //NavigationServiceのBeaconServiceをモックに差し替え
//        let beaconservice = MocBeaconService()
//        self.navigationViewController?.navigationService?.beaconservice = beaconservice
//        
//        self.navigationViewController?.updateNavigation()
//        XCTAssertEqual(self.navigationViewController?.rssi.text!, "RSSI : -74dB")
//        XCTAssertEqual(self.navigationViewController?.minor.text!, "minor id : 1")
//        XCTAssertEqual(self.navigationViewController?.navigation.text!, "Start")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
