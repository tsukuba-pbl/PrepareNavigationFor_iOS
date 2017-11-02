//
//  BeaconLoggerService.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/14.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BeaconLoggerService{
    
    /// 使用するビーコンのMinor Idのリストを取得する
    static func getBeaconMinorIdList(responseLocations: @escaping ([Int]) -> Void){
        Alamofire.request("https://gist.githubusercontent.com/Minajun/8b85ac73b686cfa036dfcb1fd56a1c83/raw/33f4a160263b99a08f326d3d330204874965cdc0/beacons.json")
            .responseJSON { response in
                var minorIdList: [Int] = []
                switch response.result {
                case .success(let response):
                    let minorIdJson = JSON(response)
                    minorIdJson["minorIdList"].forEach{(_, data) in
                        minorIdList.append(data.int!)
                    }
                    print(minorIdList)
                    break
                case .failure(let error):
                    SlackService.postError(error: error.localizedDescription, tag: "BeaconLogger Service")
                    break
                }
                responseLocations(minorIdList)
        }
    }
}
