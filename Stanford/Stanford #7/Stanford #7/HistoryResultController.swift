//
//  HistoryOverviewController.swift
//  Stanford #7
//
//  Created by Jeroen Zonneveld on 04-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class HistoryResultController : ResultController, UIPopoverPresentationControllerDelegate {
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    //array dat de geschiedenis van de ingedrukte knoppen onthoud
    var buttonHistory: [String] {
        
        // return indien bestaat de array met button informatie. Controle of het een string array is. Indien niet return dan een lege array.
        get { return defaults.objectForKey(History.DefaultsKey) as? [String] ?? [] }
        
        // indien een nieuwe toevoegen dan deze toevoegen aan de lijst
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
       
    //aanmaken van een struct
    private struct History {
        static let SegueIdentifier = "Show button history"
        static let DefaultsKey = "defaultButtonHistoryArray"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let resultPopoverReference = segue.destinationViewController as? ResultPopoverController {
                    
                    //Controle of we in de popoverPresentationController zitten om de weergave te veranderen van full screen naar een gewone pop-over op de iPhone.
                    if let popoverPresentationReference = resultPopoverReference.popoverPresentationController {
                        popoverPresentationReference.delegate = self
                    }
                    
                    //weergeven van de ingedrukte knoppen.
                    if buttonHistory.isEmpty {
                        resultPopoverReference.text = "Geen knopjes gevonden..."
                    } else {
                        resultPopoverReference.text = "\(buttonHistory)"
                    }
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    @IBAction func emptyHistory(sender: AnyObject) {
        buttonHistory.removeAll(keepCapacity: false)
    }
}