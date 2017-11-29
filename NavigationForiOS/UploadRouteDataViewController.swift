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
        let navigationAreas = appDelegate.navigationDataEntity.getNavigationAreas()
        
        //イベントIDを取得する
        let eventInfo = appDelegate.eventInfo!
        let eventId = eventInfo.id
        
        //サーバに送信する
        let navigationDataService = NavigationDataService()
        let params = navigationDataService.getNavigationDataAsParams(eventId: eventId!, sourceName: appDelegate.departure!, destinationName: appDelegate.destination!, areaArray: navigationAreas)
        let statusCode = navigationDataService.sendNavigationData(params: params, eventId: eventId!)
        
        if(statusCode == 200){ //送信成功
            
        }else if(statusCode == 400){ //ファイルのアップロードに失敗
            
        }else{ //そもそも失敗
            
        }
    }
    
    //ゴール時にアラートを表示する
    func uploadAlert(statusCode: Int){
        var message = ""
        
        if(statusCode == 200){
            message = "アップロードに成功しました！"
        }else if(statusCode == 400){
            message = "アップロードに失敗しました"
        }else{
            message = "サーバとの通信に失敗しました"
        }

        let alertController = UIAlertController(title: "Uploader", message: message,  preferredStyle: UIAlertControllerStyle.alert)
        
        //②-1 OKボタンの実装
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            //②-2 OKがクリックされた時の処理
            //成功時は，Route画面へ移動
            let next = self.storyboard!.instantiateViewController(withIdentifier: "routes")
            self.present(next,animated: true, completion: nil)
        }
        //③-1 ボタンに追加
        alertController.addAction(okAction)
        
        //④ アラートの表示
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onTouchButton(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "routes")
        self.present(next,animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
