//
//  ViewController.swift
//  IOS8SwiftPrototypeCellsTutorial
//
//  Created by Arthur Knopper on 10/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cellTapped:Bool = true
    var currentRow = 0;
  
    var transportItems = ["Mijn Vakken","Mijn Werkplekken","Projecten | Follow","Projecten | Coach"]
    
    let deadlineIcons = [""]
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //AddCell
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as! UITableViewCell
    
        cell.textLabel!.text = transportItems[indexPath.row]
    
        var imageName = UIImage(named: transportItems[indexPath.row])
        cell.imageView!.image = imageName
    
        return cell
    }
    
    //OrderCells
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        var itemToMove = transportItems[fromIndexPath.row]
        transportItems.removeAtIndex(fromIndexPath.row)
        transportItems.insert(itemToMove, atIndex: toIndexPath.row)
    }
    
    //ExpandingCells
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedRowIndex = indexPath.row
        currentRow = selectedRowIndex
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == currentRow {
            if cellTapped == false {
                cellTapped = true
                return 141
            } else {
                cellTapped = false
                return 70
            }
        }
        return 70
    }
}
