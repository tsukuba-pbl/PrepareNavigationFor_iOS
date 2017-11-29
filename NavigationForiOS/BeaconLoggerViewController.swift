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
    
    var navigations : NavigationEntity = NavigationEntity()
    var beaconLogger : BeaconLoggerController?
    
    @IBOutlet weak var loggerActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var Counter: UILabel! //ビーコンの受信を行う回数を記録するカウンタ
    var timer : Timer!
    var onStart = false //計測中かどうか
    
    var routeId = 0

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //指示を表示する
        infoLabel.text = "交差点もしくは目的地の中心に立ち、計測開始ボタンを押してください。\nその後、エリア内を歩き回り、十分に計測を行なったのち、計測終了ボタンを押してください。"
        
        //AppDelegateからroute idを取得
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        routeId = appDelegate.currentRouteId!
        
        //最初はスタートボタンは押せる状態
        startButton.isEnabled = true
        //カウンタの値を0にする
        Counter.text = "0"
        
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
            startButton.setTitle("計測終了", for: UIControlState.normal)
            startButton.backgroundColor = UIColor.red
            //くるくる開始
            loggerActivityIndicator.startAnimating()
            //計測を開始する
            beaconLogger?.startBeaconLogger(routeId: routeId)
        }else{
            beaconLogger?.stopBeaconLogger()
            //フラグ処理
            onStart = false
            //次の画面に遷移する
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
    }

    //ビューの更新
    func updateView(){
        let retval = beaconLogger?.getLoggerState()
        if(Counter.text != nil){
            Counter.text = "\(retval?.counter ?? 0)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
