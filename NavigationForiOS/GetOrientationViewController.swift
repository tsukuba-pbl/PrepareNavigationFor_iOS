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
    
    @IBOutlet weak var magneticOrientationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
