//
//  NavigationDataService.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/21.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire

class NavigationDataService{
    private let apiUrl = "https://httpbin.org/post"
    var networkManager : NetworkManager?
    let sessionManager = Alamofire.SessionManager.default
    
    init(){
        networkManager = NetworkManager()
    }
    
    public func sendNavigationData(params: Parameters){

        sessionManager.request(apiUrl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
                    .responseJSON{ response in
                        print("-------------------------")
                        print(response)
                        print("-------------------------")
                }
    }
    
    func getNavigationDataAsJSON(areaArray: Array<AreaEntity>) -> Parameters{
        var areasArrayObj = Array<Any>()
        
        areaArray.forEach { (area) in
            //beaconsの型をDictionary<Int,Int>からDictionary<String,String>に変換し，
            //配列に格納する
            var newBeaconsArray = Array<Any>()
            area.beacons.forEach { (oldDic) in
                var minorBeaconArray = Array<Any>()
                oldDic.forEach{ (key:Int, value: Int) in
                    minorBeaconArray.append(["minorId" : key, "rssi" : value])
                }
                newBeaconsArray.append(minorBeaconArray)
            }
            
            let areaJsonObj = ["routeId": area.routeId,
                           "navigation": area.navigation,
                           "isStart" : area.isStart,
                           "isGoal" : area.isGoal,
                           "isCrossroad" : area.isCrossroad,
                           "rotateDegree" : area.rotateDegree,
                           "steps" : area.steps,
                           "beacons" : newBeaconsArray] as [String : Any]
            
            areasArrayObj.append(areaJsonObj)
        }
        
        let params : Parameters = ["routes" : areasArrayObj]
        
        return params
    }
}
