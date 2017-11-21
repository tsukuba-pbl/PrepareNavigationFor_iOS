//
//  UploadRouteDataViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/02.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class UploadRouteDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //取得したデータをパラメータ形式で取得する
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let params = appDelegate.navigationDataEntity.getNavigationObjectAsParams()
        //サーバに送信する
        let navigationDataService = NavigationDataService()
        navigationDataService.sendNavigationData(params: params)
    }
    
    @IBAction func onTouchButton(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "RouteStoryboard")
        self.present(next,animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
