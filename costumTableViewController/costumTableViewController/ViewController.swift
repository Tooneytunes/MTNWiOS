//
//  ViewController.swift
//  costumTableViewController
//
//  Created by Toon van Dort & Johan van der Meulen on 08/04/15.
//  Copyright (c) 2015 Toon van Dort. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let notificatieGemist = "6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController) {
        println("done")
    }
    
    
    class MenuComponents {
        var title: String
        
        init (Title: String) {
            title = Title
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
    let menuItems = [MijnVakken(Title: "Mijn Vakken"), MijnWerkplekken(Title: "Mijn Werkplekken"), ProjectenFollow(Title: "Projecten | Follow"), ProjectenCoach(Title: "Projecten | Coach")]

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! customTableViewCell

        cell.berichtenOverzichtOutlet.text = "\(indexPath.item)"
        
        if let cellTitle = menuItems[indexPath.item].title as String? {
            cell.labelTitle.text = cellTitle
        }
        else {
            println("\(menuItems[indexPath.item])")
        }
        
        return cell
    }
    
    
    //For the automatic resizing of the cells content
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        //This value may needs adjusting
        tableView.estimatedRowHeight = 160.0
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}


