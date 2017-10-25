//
//  BeaconLoggerViewController.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/06.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import UIKit

class BeaconLoggerViewController: UIViewController, BeaconLoggerVCDelegate {
    @IBOutlet weak var startButton: UIButton! //計測開始ボタン
    @IBOutlet weak var routeIdLabel: UILabel!
    @IBOutlet weak var setRouteIdStepper: UIStepper!
    
    var navigations : NavigationEntity = NavigationEntity()
    var beaconLogger : BeaconLoggerController?
    
    @IBOutlet weak var loggerActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var Counter: UILabel! //ビーコンの受信を行う回数を記録するカウンタ
    var timer : Timer!
    var onStart = false //計測中かどうか
    
    var routeId = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppDelegateからroute idを取得
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        routeId = appDelegate.currentRouteId!
        
        //最初はスタートボタンは押せる状態
        startButton.isEnabled = true
        Counter.text = "0"
        
        routeIdLabel.text = "\(routeId)"
        //くるくる設定
        loggerActivityIndicator.hidesWhenStopped = true
        
        //使用するビーコンのminor idを設定する
        //使用するビーコンのMinor Idを設定
        BeaconLoggerService.getBeaconMinorIdList { response in
            //JSONで取得
            self.navigations.setReceiveMinorIdList(minorIdList: response)
            //受信するビーコンの情報を与え、受信を開始する
            self.beaconLogger = BeaconLoggerController(navigations : self.navigations, delegate: self)
        }
    }
    
    @IBAction func tapStartButton(_ sender: Any) {
        if(onStart == false){
            onStart = true
            startButton.setTitle("Stop", for: UIControlState.normal)
            startButton.backgroundColor = UIColor.red
            //Stepperを押せないようにする
            setRouteIdStepper.isEnabled = false
            //くるくる開始
            loggerActivityIndicator.startAnimating()
            //計測を開始する
            beaconLogger?.startBeaconLogger(routeId: routeId)
        }else{
            beaconLogger?.stopBeaconLogger()
            //ボタンの表示を変更
            startButton.setTitle("Start", for: UIControlState.normal)
            startButton.backgroundColor = UIColor.blue
            Counter.text = "0"
            //くるくる終了
            loggerActivityIndicator.stopAnimating()
            //Stepperの表示を変更
            setRouteIdStepper.value += 1.0
            routeId += 1
            routeIdLabel.text = "\(routeId)"
            setRouteIdStepper.isEnabled = true
            //フラグ処理
            onStart = false
        }
    }
    
    //次の遷移
    @IBAction func OnTouchNext(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GetOrientationStoryBoard")
        self.present(next,animated: true, completion: nil)
    }
    //ビューの更新
    func updateView(){
        let retval = beaconLogger?.getLoggerState()
        if(Counter.text != nil){
            Counter.text = "\(retval?.counter ?? 0)"
        }
    }
    
    /// Route Id 指定用のステッパの値が変更したとき
    @IBAction func didTapRouteIdStepper(_ stepper: UIStepper) {
        routeId = Int(stepper.value)
        routeIdLabel.text = "\(routeId)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
