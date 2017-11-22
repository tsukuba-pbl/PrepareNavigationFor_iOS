//
//  NetworkManager.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/21.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var manager: SessionManager?
    
    init() {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "httpbin.org": .disableEvaluation
        ]
        
        manager = SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }
}
