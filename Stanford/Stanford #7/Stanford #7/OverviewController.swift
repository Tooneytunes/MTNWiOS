//
//  OverviewController.swift
//  Stanford #7
//
//  Created by Jeroen Zonneveld on 04-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class OverviewController : UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func specialKnopje4(sender: UIButton) {
        performSegueWithIdentifier("Knopje 4", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController as? UIViewController
        
        //zorgt ervoor dat de desternation niet de ResultController is maar de NavigationController omdat deze nu in de navigation controller zit om een bovenmenu te krijgen
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        //controlleer of de desternation klopt
        if let resultControllerRefference = destination as? HistoryResultController {
            
            //controlleer of de segue identifier een waarde bevat en plaats deze in de variabel indentifier. Maakt referentie aan naar de resultController.
            if let indentifer = segue.identifier {
                
                //plaats de waarde van identifier in de resultString van de controller resultController. Je kan namelijk niet direct een waarde in een label plaatsen omdat het label nog niet bestaat. Deze wordt aangemaakt zodra de view geladen wordt. Hierdoor plaats je het eerst in een variabel en zodra de view laad kan je via viewDidLoad de label vullen met de waarde.
                resultControllerRefference.resultString = "\(indentifer)"
                resultControllerRefference.buttonHistory.append("\(indentifer) is ingedrukt")
            }
        }
    }
}
