//
//  RouteViewControllerTests.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/08/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import XCTest
import UIKit
@testable import NavigationForiOS

class RouteViewControllerTests: XCTestCase {
    let routeViewController = RouteViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsSuccessLocationInput_ロケーションの入力がない場合1() {
        XCTAssertFalse(self.routeViewController.isSuccessLocationInput(source: "", destination: ""))
    }
    
    func testIsSuccessLocationInput_ロケーションの入力がない場合2() {
        XCTAssertFalse(self.routeViewController.isSuccessLocationInput(source: "", destination: "会場A"))
    }
    
    func testIsSuccessLocationInput_ロケーションの入力が同じ場合() {
        XCTAssertFalse(self.routeViewController.isSuccessLocationInput(source: "入り口", destination: "入り口"))
    }
    
    func testIsSuccessLocationInput_正しい場合() {
        XCTAssertTrue(self.routeViewController.isSuccessLocationInput(source: "入り口", destination: "会場A"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
