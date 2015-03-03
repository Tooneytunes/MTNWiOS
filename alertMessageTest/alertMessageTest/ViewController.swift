//
//  ViewController.swift
//  alertMessageTest
//
//  Created by Jeroen Zonneveld on 03-03-15.
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

    @IBAction func showAlert(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Mijn titel"
        alert.message = "De inhoud van het bericht"
        alert.addButtonWithTitle("Oke meneer!")
        alert.show()
    }

}

