//
//  GetRoadStepRssiViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/01.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class GetRoadStepRssiViewController: UIViewController , BeaconLoggerVCDelegate{
    let pedometerService = PedometerService()
    var Steps = 0
    
    var navigations : NavigationEntity = NavigationEntity()
    var beaconLogger : BeaconLoggerController?
    
    @IBOutlet weak var StepsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RouteViewControllerで設定した目的地をAppDelegateから取得
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let routeId = appDelegate.currentRouteId
        
        //ビーコンの計測を開始する
        //使用するビーコンのminor idを設定する
        //使用するビーコンのMinor Idを設定
        BeaconLoggerService.getBeaconMinorIdList { response in
            //JSONで取得
            self.navigations.setReceiveMinorIdList(minorIdList: response)
            //受信するビーコンの情報を与え、受信を開始する
            self.beaconLogger = BeaconLoggerController(navigations : self.navigations, delegate: self)
            //計測を開始する
            self.beaconLogger?.startBeaconLogger(routeId: routeId!)
        }
        
        //歩数計測を開始する
        pedometerService.start_pedometer()
        // 1秒ごとにビューを更新する
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateView), userInfo: nil, repeats: true)
    }
    
    func updateView(){
        Steps = pedometerService.get_steps()
        StepsLabel.text = "\(Steps)歩"
    }
    
    @IBAction func onTouchNextButton(_ sender: Any) {
        self.beaconLogger?.stopBeaconLogger()
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GetBeaconRssiStoryboard")
        self.present(next,animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
