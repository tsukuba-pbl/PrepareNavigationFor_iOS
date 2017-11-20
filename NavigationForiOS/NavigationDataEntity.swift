//
//  NavigationDataEntity.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/20.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation

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
    
}
