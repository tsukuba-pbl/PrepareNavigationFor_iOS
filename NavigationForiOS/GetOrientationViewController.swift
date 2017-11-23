//
//  GetDirectionViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/10/25.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class GetOrientationViewController: UIViewController {
    let magneticSensorService = MagneticSensorSerivce()
    var magneticOrientation = 0.0
    var arrowImage : UIImage!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var magneticOrientationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //矢印の画像を読み込み
        arrowImage = UIImage(named: "arrow.png")
        arrowImageView.image = arrowImage
        //地磁気方向の取得を開始する
        magneticSensorService.startMagneticSensorService()
        // 1秒ごとにビーコンの情報を取得する
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.getMagneticOrientation), userInfo: nil, repeats: true)
    }
    
    //0.5秒ごとに地磁気方向を取得する
    func getMagneticOrientation(){
        magneticOrientation = magneticSensorService.getMagneticDirection()
        //ビューを更新
        magneticOrientationLabel.text = "\(Int(magneticOrientation))°"
    }
    
    @IBAction func onTouchNextButton(_ sender: Any) {
        //角度を格納
        appDelegate.navigationDataEntity.addOrientationData(routeId: appDelegate.currentRouteId!, orientation: Int(magneticOrientation))
        
        //route Idをインクリメント
        appDelegate.currentRouteId = appDelegate.currentRouteId! + 1
        //方向を送信する
        SlackService.postError(error: "Orientation", tag: "\(Int(magneticOrientation))°")
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GetRoadStepRssiStoryboard")
        self.present(next,animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
