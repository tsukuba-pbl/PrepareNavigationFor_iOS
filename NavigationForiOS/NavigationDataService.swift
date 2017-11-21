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
    private let apiUrl = "hoge"
    
    public func sendNavigationData(params: Parameters){
        Alamofire.request(apiUrl, method: .post, parameters: params)
    }
}
