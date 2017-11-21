//
//  MyServerTrustPolicyManager.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/21.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire

// For Swift 3 and Alamofire 4.0
open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
    
    // Override this function in order to trust any self-signed https
    open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return ServerTrustPolicy.disableEvaluation
        
        // or, if `host` contains substring, return `disableEvaluation`
        // Ex: host contains `my_company.com`, then trust it.
    }
}
