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
    private let apiUrl = "http://192.168.0.106/api/routes/1"
    
    public func sendNavigationData(params: Parameters){
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "192.168.0.106": .disableEvaluation
        ]
        let sessionManager = SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        sessionManager.request(apiUrl, method: .post, parameters: params)
            .responseJSON{ response in
                print("-------------------------")
                print(response)
                print("-------------------------")
        }
    }
}
