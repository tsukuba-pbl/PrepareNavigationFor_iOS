//
//  GetRoadStepRssiViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/01.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class GetRoadStepRssiViewController: UIViewController {
    let pedometerService = PedometerService()
    var Steps = 0
    
    @IBOutlet weak var StepsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //歩数計測を開始する
        pedometerService.start_pedometer()
        // 1秒ごとにビューを更新する
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateView), userInfo: nil, repeats: true)
    }
    
    func updateView(){
        Steps = pedometerService.get_steps()
        StepsLabel.text = "\(Steps)歩"
    }
    
    @IBAction func onTouchNextButton(_ sender: Any) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "IsDestStoryboard")
        self.present(next,animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
