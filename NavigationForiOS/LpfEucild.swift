////
////  LpfEucild.swift
////  NavigationForiOS
////
////  Created by ともひろ on 2017/09/05.
////  Copyright © 2017年 UmeSystems. All rights reserved.
////
//
//import Foundation
//
//class LpfEuclid: AlgorithmBase {
//    
//    /// 現在いる場所を取得する関数
//    ///
//    /// - Parameters:
//    ///   - navigations: ナビゲーションのルートなどの情報を含む変数
//    ///   - receivedBeaconsRssi: 現在のビーコンのRSSIの値（平滑化済み）
//    /// - Returns: return 現在の場所のENUM
//    override func getCurrentPoint(navigations: NavigationEntity, receivedBeaconsRssi: Dictionary<Int, Int>) -> POINT {
//        let maxRssiMinorId = self.getMaxRssiMinorId(receivedBeaconsRssi: receivedBeaconsRssi)
//        let targetRouteId = navigations.getRouteIdFromMinorId(minor_id: maxRssiMinorId)
//        if(self.getEuclidResult(receivedBeaconRssiList: receivedBeaconsRssi, expectedBeaconRssiList: self.getExpectedBeaconList(navigations: navigations, routeId: targetRouteId)) < 15.0){
//            //ゴールに到着したかを判定
//            if(navigations.getRouteIdFromMinorId(minor_id: maxRssiMinorId) == navigations.getGoalRouteId()){
//                return POINT.GOAL
//            }
//            //交差点到達状態へ遷移
//            return POINT.CROSSROAD
//        }
//        return POINT.OTHER
//    }
//    
//    /// 電波強度から、ビーコンまでの距離を計算する関数
//    ///
//    /// - Parameter rssi: ビーコンの電波強度（dB）
//    /// - Returns: ビーコンまでの距離 (m)
//    func getBeaconDist(rssi: Int) -> Double{
//        let TxPower = -75.0 //ビーコンから1mの距離で観測される電波強度
//        return pow(10.0, (TxPower - Double(rssi)) / 20.0)
//    }
//    
//    
//    /// ユークリッド距離の算出
//    ///
//    /// - Parameters:
//    ///   - receivedBeaconRssiList: 現在のビーコンのRSSIの値（平滑化済み）
//    ///   - expectedBeaconRssiList: 予期しているビーコンのRSSIの値
//    /// - Returns: ユークリッド距離
//    func getEuclidResult(receivedBeaconRssiList: Dictionary<Int, Int>, expectedBeaconRssiList: Dictionary<Int, Int>) -> Double {
//        var result: Double = 0.0
//        
//        expectedBeaconRssiList.forEach{ (key: Int, value: Int) in
//            result += pow(Double(receivedBeaconRssiList[key]! - value), 2)
//        }
//        
//        return round(sqrt(result)*100)/100
//    }
//    
//    /// 対象のルートIDの予期するビーコン情報を取得する関数
//    ///
//    /// - Parameters:
//    ///   - navigations: Navigation情報
//    ///   - routeId: 対象のRouteID
//    /// - Returns: 対象のRouteIDの予期するビーコンリスト
//    func getExpectedBeaconList(navigations: NavigationEntity, routeId: Int) -> Dictionary<Int, Int> {
//        var beaconList: Dictionary<Int, Int> = [:]
//        navigations.routes.forEach { (navigationPoint) in
//            if (navigationPoint.route_id == routeId) {
//                
//                navigationPoint.expectedBeacons.forEach({ (beacons) in
//                    beaconList[beacons.minor_id] = beacons.threshold
//                })
//            }
//        }
//        return beaconList
//    }
//}
