//
//  ViewController.swift
//  test api oauth
//
//  Created by Jeroen Zonneveld on 24-03-15.
//  Copyright (c) 2015 Zonneveld Cloud. All rights reserved.
//

import UIKit
import Alamofire
import OAuthSwift
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var ProjectcampusAuthorize:ProjectcampusAuthorizer?
    
    @IBAction func startConnectionWithProjectcampus(sender: UIButton) {
         ProjectcampusAuthorize = ProjectcampusAuthorizer()
    }

    
    @IBAction func showCourses(sender: UIButton) {
        var conenct = ProjectcampusAPI()
        conenct.getCourses()
    }
    
    @IBAction func showNotifications(sender: UIButton) {
        var conenct = ProjectcampusAPI()
        conenct.getNotifications()
    }
}