//
//  ResultController.swift
//  Stanford #7
//
//  Created by Jeroen Zonneveld on 04-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class ResultController : UIViewController {
    
    var resultString = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        //zodra de view geladen is kan je de waarde van de resultString plaatsen in de label. Dit kan niet eerder omdat de view dan nog niet is aangemaakt en het label dan nog niet bestaat.
        resultLabel.text = resultString
    }
}
