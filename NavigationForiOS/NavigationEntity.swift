//
//  NavigationEntity.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/23.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//
import Foundation

//交差点・目的地でのポイント情報
struct NavigationPoint{
    let route_id: Int!
    let navigation_text : String! //読み上げるナビゲーション
    let isStart: Int!
    let isGoal: Int!
    let isCrossroad: Int!
    let isRoad: Int!
    let expectedBeacons : [[BeaconRssi]] //事前計測データ
    let rotate_degree: Int! //曲がる方角
}

//ビーコンの事前計測電波強度
struct BeaconRssi{
    let minor_id: Int! //minor id
    let rssi: Int! //閾値
}

class NavigationEntity{
    var routes = [NavigationPoint]() //ルート情報
    var isAvailable = false //ルート情報が有効かどうか
    var start_id : Int!
    var goal_id : Int!
    private var receiveMinorIdList = [Int]() //minor idのリスト
    
    let UUIDList = [
        "12345678-1234-1234-1234-123456789ABC"
    ]
    
    //ルート上のポイントを追加する
    // minor_id : ビーコンのminor threshold : 閾値
    func addNavigationPoint(route_id: Int, navigation_text : String, expectedBeacons: [[BeaconRssi]], isStart: Int, isGoal: Int, isCrossroad: Int, isRoad: Int, rotate_degree: Int){
        //初めて格納される場合は、同時にminor idも登録する
        if(routes.isEmpty){
            expectedBeacons.first?.forEach { (beacon) in
                receiveMinorIdList.append(beacon.minor_id)
            }
        }
        routes.append(NavigationPoint(route_id: route_id, navigation_text: navigation_text, isStart: isStart, isGoal: isGoal, isCrossroad: isCrossroad, isRoad: isRoad, expectedBeacons: expectedBeacons, rotate_degree: rotate_degree))
    }
    
    func isStart(routeId: Int) -> Bool {
        let targetRoute = routes.filter({ (NavigationPoint) -> Bool in
            NavigationPoint.route_id == routeId
        })
        if targetRoute.count > 0 {
            return targetRoute.first?.isStart == 1
        }
        return false
    }
    
    func isGoal(routeId: Int) -> Bool {
        let targetRoute = routes.filter({ (NavigationPoint) -> Bool in
            NavigationPoint.route_id == routeId
        })
        if targetRoute.count > 0 {
            return targetRoute.first?.isGoal == 1
        }
        return false
    }
    
    func isCrossroad(routeId: Int) -> Bool {
        let targetRoute = routes.filter({ (NavigationPoint) -> Bool in
            NavigationPoint.route_id == routeId
        })
        if targetRoute.count > 0 {
            return targetRoute.first?.isCrossroad == 1
        }
        return false
    }
    
    func isRoad(routeId: Int) -> Bool {
        let targetRoute = routes.filter({ (NavigationPoint) -> Bool in
            NavigationPoint.route_id == routeId
        })
        if targetRoute.count > 0 {
            return targetRoute.first?.isRoad == 1
        }
        return false
    }
    
    func getMinorIdList() -> [Int] {
        return receiveMinorIdList
    }
    
    //指定したroute idのナビゲーション内容を返す
    func getNavigationText(route_id : Int) -> String{
        let navigationTextByRouteId = routes.filter({ $0.route_id == route_id}).first
        return (navigationTextByRouteId?.navigation_text)!
    }
    
    //指定したroute idの閾値の集合を返す
    func getRouteExpectedBeacons(route_id : Int) -> [[BeaconRssi]]{
        let beaconThresholdFilteredByRouteId = routes.filter({ $0.route_id == route_id}).first
        return (beaconThresholdFilteredByRouteId?.expectedBeacons)!
    }
    
    //指定したroute idの曲がる角度を返す
    func getNavigationDegree(route_id : Int) -> Int {
        let navigationDegreeByRouteId = routes.filter({$0.route_id == route_id}).first
        return (navigationDegreeByRouteId?.rotate_degree)!
    }
    
    //使用するビーコンのUUIDリストを返す
    func getUUIDList() -> Array<String>{
        return UUIDList
    }
    
    //使用するビーコンのminor idを手動でセットする
    func setReceiveMinorIdList(minorIdList: [Int]){
        self.receiveMinorIdList = minorIdList
    }
    
}
