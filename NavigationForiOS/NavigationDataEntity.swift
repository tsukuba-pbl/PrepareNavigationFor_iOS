//
//  NavigationDataEntity.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/20.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import Alamofire

// ポイントごとの電波強度の事前計測データとそのID
struct TRAIN_DATA{
    let routeId : Int
    var trainData : Array<Dictionary<Int, Int>> = []
}

// ポイントごとに向かう方向のデータ
struct ORIENTATION_DATA{
    let routeId : Int
    var orientation : Int
}

class NavigationDataEntity{
    var trainDataList : Array<TRAIN_DATA> = []
    var orientationDataList : Array<ORIENTATION_DATA> = []
    
    //配列内の内容を全て削除する
    public func resetAll(){
        trainDataList.removeAll()
        orientationDataList.removeAll()
    }
    
    /// トレーニングデータを追加する
    ///
    /// - Parameters:
    ///   - routeId: 計測したエリアのID
    ///   - trainData: 計測したトレーニングデータ
    public func addTrainData(routeId: Int, trainData: Array<Dictionary<Int, Int>>){
        trainDataList.append(TRAIN_DATA(routeId: routeId, trainData: trainData))
    }
    
    /// 回転方向を追加する
    ///
    /// - Parameters:
    ///   - routeId: 回転する場所のID
    ///   - orientation: 回転する方向
    public func addOrientationData(routeId: Int, orientation: Int){
        orientationDataList.append(ORIENTATION_DATA(routeId: routeId, orientation: orientation))
    }
    
    //記録した情報からナビゲーションオブジェクトを生成する
    func getNavigationAreas() -> Array<AreaEntity>{
        var areas : Array<AreaEntity> = []
        
        trainDataList.forEach { (traindata) in
            let routeId = traindata.routeId
            let rssiList = traindata.trainData
            var orientation = orientationDataList.filter({$0.routeId == routeId}).first?.orientation
            if(orientation == nil){
                orientation = 0
            }
            
            //オブジェクトへの書き出し
            let navigation_text = getNavigationText(routeId: routeId)
            let isStart = routeId == 1 ? 1 : 0
            let isGoal = routeId == trainDataList.count ? 1 : 0
            let isCrossroad = routeId % 2 == 1 ? 1 : 0
            let isRoad = routeId % 2 == 0 ? 1 : 0
            let rotateDegree = getRotateDegree(routeId: routeId)
            let steps = 100
            
            let area = AreaEntity(routeId: routeId, navigation: navigation_text, isStart: isStart, isGoal: isGoal, isCrossroad: isCrossroad, isRoad: isRoad, rotateDegree: rotateDegree, steps: steps, beacons: rssiList )
            areas.append(area)
        }
        
        return areas
    }
    
    //ナビゲーション内容をrouteIdから出す
    func getNavigationText(routeId: Int) -> String{
        var navigationText = ""
        if(routeId == 1){ //最初
            navigationText = "ナビゲーションを開始します"
        }else if(routeId == trainDataList.count){ //一番最後
            navigationText = "ナビゲーションを終了します"
        }else if(routeId % 2 == 0){ //通路の時
            navigationText = "直進です"
        }else{
            if(getRotateDegree(routeId: routeId) > 0){
                navigationText = "左折です"
            }else{
                navigationText = "右折です"
            }
        }
        return navigationText
    }
    
    //routeIdから，回転方向を出す
    func getRotateDegree(routeId: Int) -> Int{
        var deg = 0
        if(routeId == 1){
            deg = (orientationDataList.filter({$0.routeId == routeId}).first?.orientation)!
        }else if(routeId % 2 == 0 || routeId == trainDataList.count){ //通路の時と最終地点のとき
            deg = 0
        }else{
            //一つ前の交差点の方向
            let oldDeg = (orientationDataList.filter({$0.routeId == routeId - 2}).first?.orientation)!
            print(oldDeg)
            //現在の交差点の方向
            let currentDeg = (orientationDataList.filter({$0.routeId == routeId}).first?.orientation)!
            deg = oldDeg - currentDeg
            //回転方向の絶対値が180度を超える場合は，右左折を反転
            if(deg > 180){
                deg -= 180
            }else if(deg < -180){
                deg += 180
            }
        }
        return deg
    }
    
}
