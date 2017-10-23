//
//  MagneticSensorSerivice.swift
//  NavigationForiOS
//
//  Created by Owner on 2017/09/21.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import CoreLocation

class MagneticSensorSerivce: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var magineticValue: Double

    override init() {
        self.magineticValue = 0.0

        super.init()

        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            // Specifies the minimum amount of change in degrees needed for a heading service update (default: 1 degree)
            locationManager.headingFilter = kCLHeadingFilterNone
            
            // Specifies a physical device orientation from which heading calculation should be referenced
            locationManager.headingOrientation = .portrait
        }
    }
    
    func startMagneticSensorService() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingHeading()
        }
    }
    
    func stopMagineticSensorService() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.stopUpdatingHeading()
        }
    }
    
    func getMagneticDirection() -> Double{
        return magineticValue
    }
    
    // MARK: - CLLocationManager delegate
    
    //ユーザが位置情報の使用を許可しているか確認する
    //初回は NotDetermined ステータスが返るので、requestWhenInUseAuthorization() メソッドでユーザに許可を取る
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        magineticValue = newHeading.magneticHeading
    }
}
