//
//  KNN.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/09/11.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//
import Foundation

struct knnData{
    var X: [Double]
    var routeId: Int
}

struct EuclidData {
    var routeId: Int
    var euclidResult: Double
}

enum POINT {
    case GOAL
    case START
    case ROAD
    case CROSSROAD
    case OTHER
}

class KNN: AlgorithmBase{
    
    /// k近傍で指定目的地に到達したかどうかを判定し、その結果を返す
    ///
    /// - Parameters:
    ///   - navigations: ナビゲーションのルートなどの情報を含む変数
    ///   - receivedBeaconsRssi: 現在のビーコンのRSSIの値（平滑化済み）
    ///   - expectedRouteId: 到達するか判定する場所のroute id
    /// - Returns: return 現在の場所のENUM
    override func getCurrentPoint(navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, currentRouteId: Int) -> POINT {
        var nextState: POINT = POINT.OTHER
        
        //交差点にいるかいないかをk近傍で判定する
        //トレーニングデータを作成
        var trainData = [knnData]()

        // 各ルートの教師データをknnが扱える形に変更
        navigations.routes.forEach { (navigationPoint) in
            // 指定されたルートIDの教師データを取得
            let routeTrainData = navigations.getRouteExpectedBeacons(route_id: navigationPoint.route_id)
            routeTrainData.forEach { (routeTrainDataList) in
                var logData = [Double]()
                routeTrainDataList.forEach{ (routeTrainData) in
                    logData.append(Double(routeTrainData.rssi))
                }
                // 2値で考える
                if (navigationPoint.route_id == currentRouteId + 1) {
                    trainData.append(knnData(X: logData, routeId: navigationPoint.route_id))
                } else {
                    trainData.append(knnData(X: logData, routeId: currentRouteId))
                }
            }
        }
        
        // 入力のビーコンデータ
        var inputBeaconRssiList = [Double]()
        let minorIdList = navigations.getMinorIdList()
        minorIdList.forEach { (minorId) in
            inputBeaconRssiList.append(Double(receivedBeaconsRssi[minorId]!))
        }
        let inputData = knnData(X: inputBeaconRssiList, routeId: -1)
        
        // knnで計算した予測した現在のRouteId
        let knnExpectedRouteId = knn(trainData: trainData, inputData: inputData)
        
        nextState = self.getNextState(navigations: navigations, currentRouteId: currentRouteId, knnRouteId: knnExpectedRouteId)
        
        //let accuracy = getKnnAccuracy(trainData: trainData)
        //print(accuracy)
        
        return nextState
    }
    
    
    /// k近傍で取得したルートIDから次の状態を計算し返す関数
    ///
    /// - Parameters:
    ///   - navigations: ナビゲーションのルートなどの情報を含む変数
    ///   - currentRouteId: 現在のルートID
    ///   - knnRouteId: k近傍で取得したルートID
    /// - Returns: return 現在の場所のENUM
    func getNextState(navigations: NavigationEntity, currentRouteId: Int, knnRouteId: Int) -> POINT {
        let nextRouteId = currentRouteId + 1
        var nextState: POINT = POINT.OTHER
        // 現在の場所がstart地点の場合
        if (navigations.isStart(routeId: currentRouteId)) {
            // 同じ場所の場合
            if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: currentRouteId)) {
                nextState = POINT.START
                // 次の場所の場合
            } else if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: nextRouteId)) {
                if (navigations.isRoad(routeId: nextRouteId)) {
                    nextState = POINT.ROAD
                } else {
                    nextState = POINT.OTHER
                }
            } else {
                nextState = POINT.OTHER
            }
            
            // 現在の場所がgoal地点の場合
        } else if (navigations.isGoal(routeId: currentRouteId)) {
            // 同じ場所の場合
            if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: currentRouteId)) {
                nextState = POINT.GOAL
            } else {
                nextState = POINT.OTHER
            }
            
            // 現在の場所が交差点の場合は，そのまま交差点，次が道，その他の場合がある．
        } else if (navigations.isCrossroad(routeId: currentRouteId)) {
            // 同じ場所の場合
            if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: currentRouteId)) {
                nextState = POINT.CROSSROAD
                // 次の場所の場合
            } else if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: nextRouteId)) {
                if (navigations.isRoad(routeId: nextRouteId)) {
                    nextState = POINT.ROAD
                } else {
                    nextState = POINT.OTHER
                }
            } else {
                nextState = POINT.OTHER
            }
            
            // 現在の場所が道の場合は，そのまま道，次が交差点またはゴール，その他の場合がある．
        } else if (navigations.isRoad(routeId: currentRouteId)) {
            // 同じ場所の場合
            if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: currentRouteId)) {
                nextState = POINT.ROAD
                // 次の場所の場合
            } else if (self.isSameRoute(actualRouteId: knnRouteId, expectedRouteId: nextRouteId)) {
                // 次の場所がgoalの場合
                if (navigations.isGoal(routeId: nextRouteId)) {
                    nextState = POINT.GOAL
                } else if (navigations.isCrossroad(routeId: nextRouteId)){
                    nextState = POINT.CROSSROAD
                } else {
                    nextState = POINT.OTHER
                }
            } else {
                nextState = POINT.OTHER
            }
        }
        return nextState
    }
    
    override func getCurrentRouteId(navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>) -> Int {
        //交差点にいるかいないかをk近傍で判定する
        //トレーニングデータを作成
        var trainData = [knnData]()
        
        navigations.routes.forEach { (navigationPoint) in
            //対応するroute idのトレーニングデータを取得
            let routeTrainData = navigations.getRouteExpectedBeacons(route_id: navigationPoint.route_id)
            routeTrainData.forEach { (routeTrainDataList) in
                var logData = [Double]()
                routeTrainDataList.forEach{ (routeTrainData) in
                    logData.append(Double(routeTrainData.rssi))
                }
                trainData.append(knnData(X: logData, routeId: navigationPoint.route_id))
            }
        }
        
        //入力データの作成(現在取得しているビーコン)
        var beaconRssiData = [Double]()
        let expectedTrainData = navigations.getRouteExpectedBeacons(route_id: 1)
        expectedTrainData.first?.forEach({ (beacon) in
            beaconRssiData.append(Double(receivedBeaconsRssi[beacon.minor_id]!))
        })
        let inputData = knnData(X: beaconRssiData, routeId: 1)
        
        //k近傍によって判定
        // return route id
        let ans = knn(trainData: trainData, inputData: inputData)
        
        return ans
    }
    
    /// k近傍法によるrouteIdの取得
    ///
    /// - Parameters:
    ///   - trainData: 教師データ
    ///   - inputData: 入力データ
    /// - Returns: routeId
    func knn(trainData: [knnData], inputData: knnData) -> Int{
        var dist = [EuclidData]()
        //ユークリッド距離を求める
        for i in trainData{
            dist.append(EuclidData(routeId: i.routeId, euclidResult: getEuclidDist(trainData: i, inputData: inputData)))
        }
        //距離が短い順にソーティング
        let sortedDist: [EuclidData] = dist.sorted(){ $0.euclidResult < $1.euclidResult }
        //上位3つのデータを取得する
        let target = sortedDist[0...2]
        
        //上位3つのデータで多数決を取る
        var targetTop3 = Dictionary<Int, Int>()
        for i in target {
            if ((targetTop3[i.routeId]) != nil) {
                targetTop3[i.routeId] = targetTop3[i.routeId]! + 1
            } else {
                targetTop3[i.routeId] = 1
            }
        }
        //最も多いデータを返す
        let result = targetTop3.sorted { $0.1 > $1.1 }
        return (result.first?.key)!
    }
    
    /// ユークリッド距離を求める関数
    ///
    /// - Parameters:
    ///   - trainData: 教師データ
    ///   - inputData: 入力データ
    /// - Returns: ユークリッド距離
    func getEuclidDist(trainData: knnData, inputData: knnData) -> Double{
        var result: Double = 0.0
        
        for (i,value) in trainData.X.enumerated(){
            result += pow(Double(inputData.X[i] - value), 2)
        }
        result = sqrt(result)
        
        return result
    }
    
    /// k近傍の教師データに対する精度を返す
    ///
    /// - Parameter trainData: 教師データ
    /// - Returns: 精度
    func getKnnAccuracy(trainData: [knnData]) -> Double{
        var nCorrect = 0   //正答数をカウント
        var accuracy = 0.0
        
        for (i,inputData) in trainData.enumerated(){
            //入力する教師データを教師データ群から削除する
            var targetTrainData = [knnData]()
            for(j,element2) in trainData.enumerated(){
                if(i != j){
                    targetTrainData.append(element2)
                }
            }
            let answer = knn(trainData: targetTrainData, inputData: inputData)
            if(answer == inputData.routeId){
                nCorrect += 1
            }
        }
        
        accuracy = Double(nCorrect) / Double(trainData.count)
        
        return accuracy
    }
    
    func isSameRoute(actualRouteId: Int, expectedRouteId: Int) -> Bool {
        return actualRouteId == expectedRouteId
    }
}
