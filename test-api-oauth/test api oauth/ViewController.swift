//
//  ViewController.swift
//  test api oauth
//
//  Created by Jeroen Zonneveld on 24-03-15.
//  Copyright (c) 2015 Zonneveld Cloud. All rights reserved.
//

import UIKit
import Alamofire
import OAuthSwift
import SwiftyJSON

class ViewController: UIViewController {
    
    
    var config: [String: String] = [
        "authorization_url": "",
        "client_id": "",
        "client_secret": "",
        "token_url": ""
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.doOAuthSalesforce()
        

        
        
        Alamofire.request(.GET, "https://api-test.projectcamp.us/config")
            .responseJSON { (_, _, configInJSON, _) in
                println(configInJSON)
                
                
               let json = JSON(configInJSON!)
                     println(json)
                
                self.config["authorization_url"] = json["oauth"]["authorization_url"].stringValue
                self.config["client_id"] = json["oauth"]["client_id"].stringValue
                self.config["client_secret"] = json["oauth"]["client_secret"].stringValue
                self.config["token_url"] = json["oauth"]["token_url"].stringValue
                println(self.config)
                
                self.doOAuthProjectCampus()
                
        }
        
        
        
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doOAuthProjectCampus(){
        let oauthswift = OAuth2Swift(
            consumerKey:    self.config["client_id"]!,
            consumerSecret: self.config["client_secret"]!,
            authorizeUrl:   self.config["authorization_url"]!,
            accessTokenUrl: self.config["token_url"]!,
            responseType:   "code"
        )
        
        println("1")
        println(oauthswift)
        
        oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/projectcampus")!, scope: "full", state: "SALESFORCE",
        success: {
            credential, response in
                println(response)
                self.showAlertView("Salesforce", message: "oauth_token:\(credential.oauth_token)")
            println("goed gegaan")
            },
        failure: {(error:NSError!) -> Void in
            println("fout gegaan")
                println(error.localizedDescription)
        })
        
        println("2")
    }
    
    func showAlertView(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

