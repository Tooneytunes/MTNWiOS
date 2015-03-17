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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            sliderMenuButton.target = self.revealViewController()
            sliderMenuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
}

