//
//  ResultPopoverController.swift
//  Stanford #7
//
//  Created by Jeroen Zonneveld on 04-03-15.
//  Copyright (c) 2015 Jeroen Zonneveld. All rights reserved.
//

import UIKit

class ResultPopoverController : UIViewController {
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
}
