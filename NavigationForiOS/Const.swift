//
//  Const.swift
//  PrepareNavigationForiOS
//
//  Created by 梅村俊介 on 2017/11/23.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

class Const : NSObject {
    
    /* API URLs */
    #if DEBUG
    let URL_API = "http://localhost/api"
    #else
    let URL_API = "http://210.140.71.132/api"
    #endif
    
}
