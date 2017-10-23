//
//  BeaconLoggerController.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/08.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

protocol BeaconLoggerVCDelegate {
    func updateView()
}

class BeaconLoggerController : NSObject{
    var navigations : NavigationEntity = NavigationEntity()
    var beaconManager : BeaconManager = BeaconManager()
    var trainData : Array<Dictionary<Int, Int>> = []
    var timer : Timer!
    var getCounter = 0
    var state = false
    var delegate: BeaconLoggerVCDelegate?
    var routeId = 1
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - navigations: 使用するビーコン情報の入ったナビゲーション情報
    ///   - delegate: デリゲート
    ///   - routeId: 観測を行う場所のroute id
    init(navigations: NavigationEntity, delegate: BeaconLoggerVCDelegate){
        //使用するビーコン情報を格納
        self.navigations = navigations
        //デリゲートの設定
        self.delegate = delegate
        //受信するビーコンの情報を与え、受信を開始する
        beaconManager.startBeaconReceiver(navigations: self.navigations)
    }
    
    /// トレーニングデータの計測を開始する
    func startBeaconLogger(routeId: Int){
        //route idの設定
        self.routeId = routeId
        // 1秒ごとにビーコンの情報を取得する
        getCounter = 0
        //格納配列を初期化
        trainData.removeAll()
        //スレッドの開始
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getBeaconRssi), userInfo: nil, repeats: true)
        state = true
    }
    
    //Loggerの状況を取得するメソッド
    func getLoggerState() -> (state: Bool, counter: Int){
        return (state, getCounter)
    }
    
    /// ビーコンの電波を受信するメソッド
    /// tapStartButton内のスレッド呼び出しによって、1秒ごとに呼ばれる
    func getBeaconRssi(){
        //取得した回数をカウント
        getCounter += 1
        //ビーコンの電波強度の計測
        let receivedBeaconsRssiList = beaconManager.getReceivedBeaconsRssi()
        //トレーニングデータに追加
        trainData.append(receivedBeaconsRssiList)
        //ビューを更新
        //テスト実行時には、呼び出さない
        #if DEBUG
            if(TestService.isTesting() == false){
                delegate?.updateView()
            }
        #else
            delegate?.updateView()
        #endif
    }
    
    /// 終了時に呼ぶ
    func stopBeaconLogger(){
        state = false
        //テスト実行時には、呼び出さない
        #if DEBUG
            if(TestService.isTesting() == false){
                //スレッドを終了させる
                if(timer.isValid){
                    timer.invalidate()
                }
                //トレーニングデータを送信する
                sendTrainData()
            }
        #else
            //スレッドを終了させる
            if(timer.isValid){
                timer.invalidate()
            }
            //トレーニングデータを送信する
            sendTrainData()
        #endif
    }
    
    //トレーニングデータを外部に送信する
    func sendTrainData(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        let now = Date()
        var message = "Beacon Logger Train Data \n Date: \(formatter.string(from: now))\n"
        message += "route id, \(routeId)\n"
        
        SlackService.postBeaconLog(log: message, tag: "Beacon Logger")
        
        for value in self.getMessages() {
            SlackService.postBeaconLog(log: value, tag: "Beacon Logger")
        }
    }
    
    func getMessages() -> [String] {
        var messageList = [String]()
        var tmpMessage = ""
        // message += "[\n"
        
        for (key, i) in trainData.enumerated(){
            tmpMessage += "\t[\n"
            for j in navigations.getMinorIdList(){
                tmpMessage += "\t\t{\"minorId\": \(j), \"rssi\": \(i[j] ?? -100)},\n"
            }
            tmpMessage += "\t],\n"
            if key%10 == 0 {
                messageList.append(tmpMessage)
                tmpMessage = ""
            }
        }
        // message += "],\n"
        return messageList
    }

}
