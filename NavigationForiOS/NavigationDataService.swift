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
    var apiUrl = "\(Const().URL_API)/routes/"
    let sessionManager = Alamofire.SessionManager.default
    
    //ナビゲーションデータを送信する
    public func sendNavigationData(params: Parameters, eventId: String, responseStatusCode: @escaping (Int) -> Void){
        var statusCode = 0
        apiUrl += eventId;
        
        Alamofire.request(apiUrl, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON{ response in
                switch response.result {
                case .success:
                    statusCode = (response.response?.statusCode)!
                    break
                case .failure(let error):
                    SlackService.postError(error: error.localizedDescription, tag: "NavigationDataService")
                    statusCode = -1
                    break
                }
                responseStatusCode(statusCode)
            }
    }
    
    func getNavigationDataAsParams(eventId: String, sourceName: String, destinationName: String, areaArray: Array<AreaEntity>) -> Parameters{
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
                           "isRoad" : area.isRoad,
                           "rotateDegree" : area.rotateDegree,
                           "steps" : area.steps,
                           "beacons" : newBeaconsArray] as [String : Any]
            
            areasArrayObj.append(areaJsonObj)
        }
        
        //パラメータ生成
        let params : Parameters = [
            "eventId" : eventId,
            "sourceName" : sourceName,
            "destinationName" : destinationName,
            "areas" : areasArrayObj]
        
        return params
    }
}
