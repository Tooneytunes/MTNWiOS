//
//  ViewController.swift
//  costumTableViewController
//
//  Created by Toon van Dort & Johan van der Meulen on 08/04/15.
//  Copyright (c) 2015 Toon van Dort. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    class MenuComponents {
        var title: String
        var amountOfNotifications: Int
        
        init (Title: String) {
            title = Title
            amountOfNotifications = Int()
        }
    }
    
   
    class MijnVakken: MenuComponents {
        override init(Title: String) {
            let title = Title
            super.init(Title: title)
        }
    }
    class MijnWerkplekken: MenuComponents {
        override init(Title: String) {
            let title = Title
            super.init(Title: title)
        }
    }
    class ProjectenFollow: MenuComponents {
        override init(Title: String) {
            let title = Title
            super.init(Title: title)
        }
    }
    class ProjectenCoach: MenuComponents {
        override init(Title: String) {
            let title = Title
            super.init(Title: title)
        }
    }
    
    
    
    
    //===========TABLEVIEW CODE============//
    var menuItems = [MijnVakken(Title: "Mijn Vakken"), MijnWerkplekken(Title: "Mijn Werkplekken"), ProjectenFollow(Title: "Projecten | Follow"), ProjectenCoach(Title: "Projecten | Coach")]
    
    var menuAmountOfNotes = [5, 9, 0, 10]

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! customTableViewCell

        if let cellTitle = menuItems[indexPath.item].title as String? {
            cell.labelTitle.text = cellTitle
        }
        else {
            println("\(menuItems[indexPath.item])")
        }
        
        if menuAmountOfNotes[indexPath.item] > 0 {
            menuItems[indexPath.item].amountOfNotifications = menuAmountOfNotes[indexPath.item]
        } else {
            cell.berichtenOverzichtOutlet.hidden = true
        }
        
//        menuItems[1].amountOfNotifications = menuAmountOfNotes[1]
        
        cell.berichtenOverzichtOutlet.text = "\(menuItems[indexPath.item].amountOfNotifications)"
        
        return cell
    }
    
    
    //For the automatic resizing of the cells content
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        //This value may needs adjusting
        tableView.estimatedRowHeight = 160.0
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE FOR WHEN AN TABLECELL HAS BEEN PRESSED
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dvc = segue.destinationViewController as? ViewDetailCourseController {
                dvc.testTitle = "Courses"
            }
        }
}



