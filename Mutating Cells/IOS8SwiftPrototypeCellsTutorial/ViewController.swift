//
//  ViewController.swift
//  IOS8SwiftPrototypeCellsTutorial
//
//  Created by Arthur Knopper on 10/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mijnVakken = ["Engels","Frans","Natuurkunde"]
    var mijnWerkplekken = ["Lokaal 1","Lokaal 2","Lokaal 3"]
    var projecteniFollow = ["Meester","Leraar","Juf"]
    var projecteniCoach = ["Leerling","Leerling2","Leerling3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //AddHeader
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Mijn Vakken";
            //return sectionHeaderView
        case 1:
            headerCell.headerLabel.text = "Mijn Werkplekken";
            //return sectionHeaderView
        case 2:
            headerCell.headerLabel.text = "Projecten I Follow";
            //return sectionHeaderView
        case 3:
            headerCell.headerLabel.text = "Projecten I Coach";
            //return sectionHeaderView
        default:
            headerCell.headerLabel.text = "Other";
        }
        
        return headerCell
    }
    
    //AddCell
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("subCell") as! UITableViewCell
        
        // 3
        // Configure the cell...
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = mijnVakken[indexPath.row]
        case 1:
            cell.textLabel?.text = mijnWerkplekken[indexPath.row]
        case 2:
            cell.textLabel?.text = projecteniFollow[indexPath.row]
        case 3:
            cell.textLabel?.text = projecteniCoach[indexPath.row]
            //return sectionHeaderView
        default:
            cell.textLabel?.text = "Other"
        }
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    //ExpandingCells
    var currentRow = 0;
    var cellTapped:Bool = false
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    var selectedRowIndex = indexPath.row
    selectedRowIndex = currentRow
    
    tableView.beginUpdates()
    tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.row == currentRow {
    if cellTapped == false {
    cellTapped = true
    return 100
    } else {
    cellTapped = false
    return 70
    }
    }
    return 70
    }
    */
}
