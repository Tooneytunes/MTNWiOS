//
//  ProjectcampusAPI.swift
//  test api oauth
//
//  Created by Jeroen Zonneveld on 09-04-15.
//  Copyright (c) 2015 Zonneveld Cloud. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ProjectcampusAPI {
    
    init() {
        Router.OAuthToken = NSUserDefaults.standardUserDefaults().stringForKey("oAuthToken")!
    }
    
    enum Router: URLRequestConvertible {
        static let baseURLString = "http://api-test.projectcamp.us"
        static var OAuthToken: String?
        
        case CreateUser([String: AnyObject])
        case ReadCourses(String)
        case ReadNotifications(String)
        case UpdateUser(String, [String: AnyObject])
        case DestroyUser(String)
        
        var method: Alamofire.Method {
            switch self {
            case .CreateUser:
                return .POST
            case .ReadCourses:
                return .GET
            case .ReadNotifications:
                return .GET
            case .UpdateUser:
                return .PUT
            case .DestroyUser:
                return .DELETE
            }
        }
        
        var path: String {
            switch self {
            case .CreateUser:
                return "/users"
            case .ReadCourses(let username):
                return "/organizations/test"
            case .ReadNotifications(let username):
                return "/notifications"
            case .UpdateUser(let username, _):
                return "/users/\(username)"
            case .DestroyUser(let username):
                return "/users/\(username)"
            }
        }
        
        // MARK: URLRequestConvertible
        
        var URLRequest: NSURLRequest {
            let URL = NSURL(string: Router.baseURLString)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            
            if let token = Router.OAuthToken {
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                println("\(mutableURLRequest)")
            }
            
            switch self {
            case .CreateUser(let parameters):
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
            case .UpdateUser(_, let parameters):
                return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
            default:
                return mutableURLRequest
            }
        }
    }
    
    func getNotifications() {
        Alamofire.request(Router.ReadNotifications("")).responseJSON { (req, res, json, error) in
            if(error != nil) {
                NSLog("Error: \(error)")
                println(req)
                println(res)
            }
            else {
                println(json)
                //println("Success: \(url)")
                //   var json = JSON(json!)
            }
        }
    }
    
    func getCourses() {
        Alamofire.request(Router.ReadCourses("")).responseJSON { (req, res, json, error) in
            if(error != nil) {
                NSLog("Error: \(error)")
                println(req)
                println(res)
            }
            else {
                println(json)
            //    println(req)
           //     println(res)
          //      println(error)
                //println("Success: \(url)")
                //   var json = JSON(json!)
            }
        }
    }
}