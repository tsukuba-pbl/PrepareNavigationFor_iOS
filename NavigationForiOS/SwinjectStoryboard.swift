//
//  File.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/08/27.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard {
    class func setup() {
        
        let container = defaultContainer
        
        container.register(BeaconManager.self) { _ in
            BeaconManager()
        }
        
        container.register(PedometerService.self) { _ in
            PedometerService()
        }
        
        container.register(EventService.self) { _ in
            EventService()
        }
        
        container.register(KNN.self) { _ in
            KNN()
        }
        
        container.register(NavigationService.self) { r in
            NavigationService(beaconManager: r.resolve(BeaconManager.self)!, algorithm: r.resolve(KNN.self)!)
        }
        
        // NavigationViewControllerのDIの設定
        container.storyboardInitCompleted(NavigationViewController.self) { (r, vc) in
            vc.navigationService = r.resolve(NavigationService.self)!
            vc.pedometerService = r.resolve(PedometerService.self)!
        }
        
        // HomeViewControllerのDIの設定
        container.storyboardInitCompleted(HomeViewController.self) { (r, vc) in
            vc.eventService = r.resolve(EventService.self)!
        }

    }
}
