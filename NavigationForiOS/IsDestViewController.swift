//
//  IsDestViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/01.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class IsDestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func OnTouchYesButon(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "UploadStoryboard")
        self.present(next,animated: true, completion: nil)
    }
    
    @IBAction func OnTouchNoButton(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "GetOrientationStoryBoard")
        self.present(next,animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
