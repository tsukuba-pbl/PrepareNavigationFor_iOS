//
//  StartCreateRouteViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/10/24.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class StartRouteCreateViewController: UIViewController {
    
    @IBOutlet weak var startNavigationLabel: UILabel!//開始位置を伝える用
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RouteViewControllerで設定した目的地をAppDelegateから取得
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let source = appDelegate.departure!
        //計測を行うroute idを設定
        appDelegate.currentRouteId = 1
        //Route設定画面で指定された開始地点の名前を表示する
        startNavigationLabel.text = source + "に立ってください"
        
        //内容を全てリセットする
        appDelegate.navigationDataEntity.resetAll()
    }
    
    //電波強度の計測ボタンが押されたら、計測画面に遷移する
    @IBAction func OnButtonTouch(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GetBeaconRssiStoryboard")
        self.present(next,animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
