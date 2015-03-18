//
//  SidebarNotificationViewController.swift
//  Projectcampus
//
//  Created by Jeroen Zonneveld on 18-03-15.
//  Copyright (c) 2015 Projectcampus. All rights reserved.
//

import UIKit

class SidebarNotificationViewController : UITableViewController {
    
    let notificationsList : [String] = ["Notificatie 1", "Notificatie 4", "Notificatie test"]
     let CELL_TYPE_ID = "NOTIF"
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_TYPE_ID) as? UITableViewCell
        
        if (cell == nil) {
            println ("Nieuwe cell aangemaakt bij \(indexPath.row)")
            
            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: CELL_TYPE_ID)
        }
        
        cell!.textLabel?.text = notificationsList[indexPath.row]
        
        return cell!
    }
    
    
}
