//
//  UploadRouteDataViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/02.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class UploadRouteDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onTouchButton(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "RouteStoryboard")
        self.present(next,animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
