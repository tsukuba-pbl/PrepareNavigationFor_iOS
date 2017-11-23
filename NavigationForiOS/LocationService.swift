//
//  LocationService.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/08/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class LocationService {
    /// 会場にある各地点の名前を取得
    ///
    /// - Returns: 地点を含む配列
    static func getLocations(responseLocations: @escaping ([String]) -> Void){
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let eventInfo = appDelegate.eventInfo!
        if let eventId = eventInfo.id {
            Alamofire.request("\(Const().URL_API)/events/\(eventId)/locations")
                .responseJSON { response in
                    debugPrint(response)
                    var locations: [String] = []
                    switch response.result {
                    case .success(let response):
                        let locationJson = JSON(response)
                        locationJson["locations"].forEach{(_, data) in
                            locations.append(data["name"].string!)
                        }
                        break
                    case .failure(let error):
                        SlackService.postError(error: error.localizedDescription, tag: "Location Service")
                        break
                    }
                    responseLocations(locations)
            }
        }
    }
}
