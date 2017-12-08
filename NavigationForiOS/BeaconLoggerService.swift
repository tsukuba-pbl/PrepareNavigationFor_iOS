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
import UIKit

class BeaconLoggerService {
    
    /// 使用するビーコンのMinor Idのリストを取得する
    static func getBeaconMinorIdList(responseLocations: @escaping ([Int]) -> Void){
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let eventInfo: EventEntity = appDelegate.eventInfo!
        let eventId: String = eventInfo.id!
        Alamofire.request("\(Const().URL_API)/events/\(eventId)/beacons")
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
