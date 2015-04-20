//
//  awesomeCell.swift
//  costumTableViewController
//
//  Created by Admin on 13/04/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation
import UIKit

class customTableViewCell: UITableViewCell {
    
    var _nummertjeString = String()
    
    @IBOutlet var berichtenOverzichtOutlet: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    
    func SetBerichtenOverzichtNumber (value: String) {
        
        _nummertjeString = value
        
    }
}
