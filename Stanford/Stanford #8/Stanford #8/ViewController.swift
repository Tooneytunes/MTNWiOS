//
//  ViewController.swift
//  Stanford #8
//
//  Created by Jeroen Zonneveld on 05-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpdateUI()
    }

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var secure : Bool = false {
        didSet {
            UpdateUI()
        }
    }
    
    private func UpdateUI() {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Wachtwoord beveiligd" : "Wachtwoord"
    }
    
    @IBAction func changeSecurity(sender: UIButton) {
        secure = !secure
    }

}

