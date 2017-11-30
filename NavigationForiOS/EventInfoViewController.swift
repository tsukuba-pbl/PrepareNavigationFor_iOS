//
//  EventInfoViewController.swift
//  NavigationForiOS
//
//  Created by ともひろ on 2017/10/17.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class EventInfoViewController: UIViewController {
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventInfo: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var eventEndDate: UILabel!
    
    var event: EventEntity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        self.event = appDelegate.eventInfo!

        self.eventName.text = self.event?.name
        self.eventInfo.text = self.event?.info
        self.eventDate.text = self.event?.startDate
        self.eventEndDate.text = self.event?.endDate
        self.eventLocation.text = self.event?.location
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
