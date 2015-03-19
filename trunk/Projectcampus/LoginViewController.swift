//
//  LoginViewController.swift
//  Projectcampus
//
//  Created by Jeroen Zonneveld on 19-03-15.
//  Copyright (c) 2015 Projectcampus. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        passwordField.secureTextEntry = true
    }
}