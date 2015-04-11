//
//  Class ProjectcampusAuthorizer
//  ProjectcampusAuthorizer.swift
//
//  Created by Jeroen Zonneveld on 09-04-15.
//  Copyright (c) 2015 Zonneveld Cloud. All rights reserved.
//

import Alamofire
import OAuthSwift
import SwiftyJSON

class ProjectcampusAuthorizer {
    
    private var config: [String: String] = [
        "authorization_url": "",
        "client_id": "",
        "client_secret": "",
        "token_url": ""
    ]
    
    //private var OAuthToken:String?
    
    init() {
        self.getConfig()
    }
    
    func getConfig() {
        Alamofire.request(.GET, "https://api-test.projectcamp.us/config")
            .responseJSON { (_, _, apiConfiguration, _) in

                let json = JSON(apiConfiguration!)
                
                self.config["authorization_url"] = json["oauth"]["authorization_url"].stringValue
                self.config["client_id"] = json["oauth"]["client_id"].stringValue
                self.config["client_secret"] = json["oauth"]["client_secret"].stringValue
                self.config["token_url"] = json["oauth"]["token_url"].stringValue
                
                self.receiveToken()
        }
    }
    
    func receiveToken(){
        let oauthswift = OAuth2Swift(
            consumerKey:    self.config["client_id"]!,
            consumerSecret: self.config["client_secret"]!,
            authorizeUrl:   self.config["authorization_url"]!,
            accessTokenUrl: self.config["token_url"]!,
            responseType:   "code"
        )
        
        oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/projectcampus")!, scope: "", state: "PROJECTCAMPUS", success: {
            credential, response in
            
            //put token in the router form credential.oauth_token
            self.setToken(credential.oauth_token)
            
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
    }
    
    func setToken(OAuthToken:String) {
        NSUserDefaults.standardUserDefaults().setValue(OAuthToken, forKey: "oAuthToken")
    }
}