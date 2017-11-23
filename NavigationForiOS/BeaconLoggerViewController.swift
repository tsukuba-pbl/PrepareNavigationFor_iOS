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
    
    @IBOutlet weak var getOrientationButton: UIButton!
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
        //方位角の計測ボタンは押せないようにする
        getOrientationButton.isEnabled = false
        //カウンタの値を0にする
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
            //方位角の計測ボタンを押せないようにする
            getOrientationButton.isEnabled = false
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
            //フラグ処理
            onStart = false
            //方位角の計測ボタンを押せるようにする
            getOrientationButton.isEnabled = true
        }
    }
    
    //次の遷移
    @IBAction func OnTouchNext(_ sender: Any) {
        //最初の時とそれ以外の時で遷移先が変わる
        //routeId = 1のとき最初として判断する
        //最初 -> 方向計測
        //2回目以降 -> 目的地かどうか？
        //route idを取得
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let routeId = appDelegate.currentRouteId
        
        var next = self.storyboard!.instantiateViewController(withIdentifier: "IsDestStoryboard")
        //route idが1のときは，方向計測に遷移
        if(routeId == 1){
            next = self.storyboard!.instantiateViewController(withIdentifier: "GetOrientationStoryBoard")
        }
        
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
