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

class LocationService {
    /// 会場にある各地点の名前を取得
    ///
    /// - Returns: 地点を含む配列
    static func getLocations(responseLocations: @escaping ([String]) -> Void){
        Alamofire.request("https://gist.githubusercontent.com/ferretdayo/052e93d7c3067832e39f5ebe8cbfb004/raw/885aae273ae6b5d78380b917357e6827dba0de70/location.json")
        .responseJSON { response in
            var locations: [String] = []
            switch response.result {
            case .success(let response):
                let locationJson = JSON(response)
                locationJson["locations"].forEach{(_, data) in
                    locations.append(data.string!)
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
