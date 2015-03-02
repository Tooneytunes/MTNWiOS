//
//  ViewController.swift
//  notificationTest
//
//  Created by Jeroen Zonneveld on 02-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func button(sender: UIButton) {
        var localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "agree that you like Jeroen"
        localNotification.alertBody = "Dit is een voorbeeld."
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }
}

