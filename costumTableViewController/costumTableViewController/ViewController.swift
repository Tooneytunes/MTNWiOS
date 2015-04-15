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
    
    
    
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController) {
        println("done")
    }
    
    
    
    
    //===========TABLEVIEW CODE============//
    let transportItems = ["Mijn Vakken", "Mijn Werkplekken", "Projecten | Follow","Projecten | Coach"]

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! customTableViewCell

        cell.button.setTitle("\(indexPath.item)", forState: .Normal)
        cell.labelTitle.text = transportItems[indexPath.item]
        
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

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let courseDetailViewController = segue.destinationViewController as? ViewDetailCourseController {
            
            if let identifier = segue.identifier {
                courseDetailViewController.testString = "bla"
            }
            else {
                
                println("Segue not succeeded")
                
            }
        }
    }


}


