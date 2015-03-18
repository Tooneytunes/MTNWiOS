//
//  MainMenuController.swift
//  Projectcampus
//
//  Created by Jeroen Zonneveld on 17-03-15.
//  Copyright (c) 2015 Projectcampus. All rights reserved.
//

import UIKit

class MainMenuController : UIViewController {
    
    @IBOutlet weak var sliderMenuButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            sliderMenuButton.target = self.revealViewController()
            sliderMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if self.revealViewController() != nil {
            notificationButton.target = self.revealViewController()
            notificationButton.action = "rightRevealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}

