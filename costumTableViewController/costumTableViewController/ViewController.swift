//
//  ViewController.swift
//  costumTableViewController
//
//  Created by Admin on 08/04/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let imageItems = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as UITableViewCell
        
        cell.textLabel!.text = imageItems[indexPath.row]
        
        var imageName = UIImage(named: imageItems[indexPath.row])
        cell.imageView!.image = imageName
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

