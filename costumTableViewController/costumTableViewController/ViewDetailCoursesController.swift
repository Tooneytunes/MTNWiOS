//
//  ViewDetailCoursesController.swift
//  costumTableViewController
//
//  Created by Johan van der Meulen on 15/04/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation
import UIKit

class ViewDetailCourseController: UITableViewController {
    
    @IBOutlet weak var UINavItemOutlet: UINavigationItem!
    
    var testTitle = String()
    
    override func viewDidLoad() {
        UINavItemOutlet.title = testTitle
    }
    
    
    
    
}
