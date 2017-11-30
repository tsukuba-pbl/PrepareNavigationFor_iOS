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
        
        navigationDataService.sendNavigationData(params: params, eventId: eventId!) { response in
            //アラートの表示
            self.uploadAlert(statusCode: response)
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
        
        //成功時
        if(statusCode == 200){
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
                //成功時はルート画面へ遷移するようにする
                let next = self.storyboard!.instantiateViewController(withIdentifier: "routes")
                self.present(next,animated: true, completion: nil)
            }
            alertController.addAction(okAction)
        }else{
            let resendAction = UIAlertAction(title: "再送信", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
                //再送信するときは，自分自身に遷移する
                let toUpload = self.storyboard!.instantiateViewController(withIdentifier: "UploadStoryboard")
                self.present(toUpload,animated: true, completion: nil)
            }
            alertController.addAction(resendAction)
            let backAction = UIAlertAction(title: "再送信しない", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
                //再送信しないときは，ルート画面へ遷移する
                let toRoute = self.storyboard!.instantiateViewController(withIdentifier: "routes")
                self.present(toRoute,animated: true, completion: nil)
            }
            alertController.addAction(backAction)
        }
        
        //④ アラートの表示
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
