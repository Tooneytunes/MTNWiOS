//
//  ViewController.swift
//  deleteorno
//
//  Created by Jeroen Zonneveld on 02-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//


//////////////////////////////////////////////////////////////////////////////////////////////////
// BELANGRIJK:
// Je veranderd de taal voor het debuggen op de volgende locatie in het menu:
// Product --> Scheme --> Edit scheme
//
// Onder het tabje "Options" verander je "Application Language" naar de taal die je wilt.
//
// Taal informatie wordt gehaald uit Localizable.strings
//
// Iedere taal heeft een eigen map in de root
//////////////////////////////////////////////////////////////////////////////////////////////////



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //label.text = "GOOD_MORNING"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func clickButton(sender: UIButton) {
        
        label.text = NSLocalizedString("GOOD_MORNING", comment: "goedemorgen")
        
        ///n goedemorgen in variabel plaatsen
    }

}

