//
//  NavigationState.swift
//  NavigationForiOS
//
//  Created by みなじゅん on 2017/08/31.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//
import Foundation

protocol NavigationState {
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase)
    func getMode(navigations: NavigationEntity) -> Int
    func getNavigation(navigations: NavigationEntity) -> String
    func getNavigationState() -> (state: String, currentRouteId: Int)
}

//ビーコン受信不能状態
class None: NavigationState{
    func getNavigationState() -> (state: String, currentRouteId: Int) {
        return ("None", self.currentRouteId)
    }

    private let currentRouteId: Int
    
    init(currentRouteId: Int){
        self.currentRouteId = currentRouteId
    }
    
    /// ナビゲーションテキストの取得
    ///
    /// - Parameter navigations: ナビゲーション情報
    /// - Returns: ナビゲーションテキスト
    func getNavigation(navigations: NavigationEntity) -> String {
        return "None"
    }
    
    func getMode(navigations: NavigationEntity) -> Int {
        return -1
    }
    
    /// ナビゲーション状態の更新をする関数
    ///
    /// - Parameters:
    ///   - navigationService: ナビゲーションサービス
    ///   - navigations: ナビゲーション情報
    ///   - receivedBeaconsRssi: その地点で取得したビーコン情報
    ///   - algorithm: 適用アルゴリズム
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase) {

        //受信できた場合、Start状態へ遷移
        if(!receivedBeaconsRssi.isEmpty){
            navigationService.navigationState = Start(currentRouteId: self.currentRouteId)
        }
    }
}

//前進状態
class Road: NavigationState{
    func getNavigationState() -> (state: String, currentRouteId: Int) {
        return ("Road", self.currentRouteId)
    }

    private let currentRouteId: Int
    
    init(currentRouteId: Int){
        self.currentRouteId = currentRouteId
    }
    
    /// ナビゲーションテキストの取得
    ///
    /// - Parameter navigations: ナビゲーション情報
    /// - Returns: ナビゲーションテキスト
    func getNavigation(navigations: NavigationEntity) -> String {
        return navigations.getNavigationText(route_id: self.currentRouteId)
    }
    
    func getMode(navigations: NavigationEntity) -> Int {
        return 1
    }
    
    /// ナビゲーション状態の更新をする関数
    ///
    /// - Parameters:
    ///   - navigationService: ナビゲーションサービス
    ///   - navigations: ナビゲーション情報
    ///   - receivedBeaconsRssi: その地点で取得したビーコン情報
    ///   - algorithm: 適用アルゴリズム
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase) {
        
        switch algorithm.getCurrentPoint(navigations: navigations, receivedBeaconsRssi: receivedBeaconsRssi, currentRouteId: self.currentRouteId) {
            case .CROSSROAD :
                navigationService.navigationState = Crossroad(currentRouteId: self.currentRouteId+1)
            case .ROAD :
                navigationService.navigationState = Road(currentRouteId: self.currentRouteId)
            case .GOAL :
                navigationService.navigationState = Goal(currentRouteId: self.currentRouteId+1)
            case .OTHER: break
            default: break
        }
        
    }
    
}

//交差点到達状態
//指定方向に移動することで、次状態へ遷移
class Crossroad: NavigationState{
    func getNavigationState() -> (state: String, currentRouteId: Int) {
        return ("Crossroad", self.currentRouteId)
    }
    
    let motionService: MotionService
    private let currentRouteId: Int
    private let allowableDegree: Int = 10
    
    init(currentRouteId: Int){
        self.currentRouteId = currentRouteId
        motionService = MotionService()
        motionService.startMotionManager()
    }
    
    /// ナビゲーションテキストの取得
    ///
    /// - Parameter navigations: ナビゲーション情報
    /// - Returns: ナビゲーションテキスト
    func getNavigation(navigations: NavigationEntity) -> String {
        return navigations.getNavigationText(route_id: self.currentRouteId)
    }
    
    func getMode(navigations: NavigationEntity) -> Int {
        var retval = -1
        let rotateDegree = navigations.getNavigationDegree(route_id: self.currentRouteId)
        //右折のとき3,左折のとき2をリターン
        if(rotateDegree == 0){
            retval = 1
        }else if(rotateDegree > 0){
            retval = 2
        }else{
            retval = 3
        }
        return retval
    }
    
    /// ナビゲーション状態の更新をする関数
    ///
    /// - Parameters:
    ///   - navigationService: ナビゲーションサービス
    ///   - navigations: ナビゲーション情報
    ///   - receivedBeaconsRssi: その地点で取得したビーコン情報
    ///   - algorithm: 適用アルゴリズム
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase) {
        let rotateDegree = navigations.getNavigationDegree(route_id: self.currentRouteId)

        if (rotateDegree - allowableDegree < motionService.getYaw() && rotateDegree + allowableDegree > motionService.getYaw()) {
            motionService.stopMotionManager()
            navigationService.navigationState = Road(currentRouteId: self.currentRouteId + 1)
        }
    }
}

//ナビゲーション開始地点状態
class Start: NavigationState{
    func getNavigationState() -> (state: String, currentRouteId: Int) {
        return ("Start", self.currentRouteId)
    }
    
    private let currentRouteId: Int
    
    init(currentRouteId: Int){
        self.currentRouteId = currentRouteId
    }
    
    
    /// ナビゲーションテキストの取得
    ///
    /// - Parameter navigations: ナビゲーション情報
    /// - Returns: ナビゲーションテキスト
    func getNavigation(navigations: NavigationEntity) -> String {
        return navigations.getNavigationText(route_id: self.currentRouteId)
    }
    
    func getMode(navigations: NavigationEntity) -> Int {
        return 1
    }
    
    /// ナビゲーション状態の更新をする関数
    ///
    /// - Parameters:
    ///   - navigationService: ナビゲーションサービス
    ///   - navigations: ナビゲーション情報
    ///   - receivedBeaconsRssi: その地点で取得したビーコン情報
    ///   - algorithm: 適用アルゴリズム
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase) {
        let expectedDegree = Double(navigations.getNavigationDegree(route_id: self.currentRouteId))
        let allowableDegree = 10.0
        
        if(navigationService.getCurrentRouteId(navigations: navigations) == 1){
            //地磁気情報を取得する
            let magneticOrientation = navigationService.getMagneticOrientation()
            if(magneticOrientation < expectedDegree + allowableDegree && magneticOrientation > expectedDegree - allowableDegree){
                //指定方向の場合は次の状態に遷移
                navigationService.navigationState = Road(currentRouteId: self.currentRouteId+1)
            }else{
                if(magneticOrientation > expectedDegree){
                    navigationService.speech(speechText: "左")
                }else{
                    navigationService.speech(speechText: "右")
                }
            }
        }
    }
    
}


//目的地到達状態
class Goal: NavigationState{
    func getNavigationState() -> (state: String, currentRouteId: Int) {
        return ("Goal", self.currentRouteId)
    }

    private let currentRouteId: Int

    
    init(currentRouteId: Int){
        self.currentRouteId = currentRouteId
    }
    
    /// ナビゲーションテキストの取得
    ///
    /// - Parameter navigations: ナビゲーション情報
    /// - Returns: ナビゲーションテキスト
    func getNavigation(navigations: NavigationEntity) -> String {
        return navigations.getNavigationText(route_id: self.currentRouteId)
    }
    
    func getMode(navigations: NavigationEntity) -> Int {
        return 4
    }
    
    /// ナビゲーション状態の更新をする関数
    ///
    /// - Parameters:
    ///   - navigationService: ナビゲーションサービス
    ///   - navigations: ナビゲーション情報
    ///   - receivedBeaconsRssi: その地点で取得したビーコン情報
    ///   - algorithm: 適用アルゴリズム
    func updateNavigation(navigationService: NavigationService, navigations: NavigationEntity, receivedBeaconsRssi : Dictionary<Int, Int>, algorithm: AlgorithmBase) {
        
        switch algorithm.getCurrentPoint(navigations: navigations, receivedBeaconsRssi: receivedBeaconsRssi, currentRouteId: self.currentRouteId) {
            case .GOAL :
                navigationService.navigationState = Goal(currentRouteId: self.currentRouteId)
            case .OTHER: break
            default: break
        }
    }
    
}
