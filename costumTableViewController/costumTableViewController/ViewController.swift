//
//  ViewController.swift
//  costumTableViewController
//
//  Created by Toon van Dort & Johan van der Meulen on 08/04/15.
//  Copyright (c) 2015 Toon van Dort. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let transportItems = ["Mijn Vakken", "Mijn Werkplekken", "Projecten | Follow","Projecten | Coach"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // awesomeButton.setTitle(deadlineIcons, forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportItems.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var customCell = costumTableViewCell()
        
//      cell.deadlineBlue.setTitle(deadlineIcons, forState: .Normal)
        println("\(customCell.initialise(tableView, transportItems: transportItems, indexPath: indexPath))")
        
        return customCell.initialise(tableView, transportItems: transportItems, indexPath: indexPath)
    }
}


class costumTableViewCell: UITableViewCell {
    
    class customTableViewCellButton: UIButton {
        
    }
    
//    @IBOutlet var buttonLOL: UIButton!
    var testButton = customTableViewCellButton()
    
    var deadlineIcons = "5"
    
    func initialise(tableView: UITableView, transportItems: [String], indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as UITableViewCell
        cell.textLabel!.text = transportItems[indexPath.row]
        var imageName = UIImage(named: transportItems[indexPath.row])
        cell.imageView!.image = imageName
        
        println("\(transportItems[indexPath.row])")
        println(testButton.currentTitle, "\(deadlineIcons)")

        
        return cell
    }
 }


