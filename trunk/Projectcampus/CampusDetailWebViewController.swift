//
//  CampusDetailWebViewController.swift
//  Projectcampus
//
//  Created by Jeroen Zonneveld on 19-03-15.
//  Copyright (c) 2015 Projectcampus. All rights reserved.
//

import UIKit

class CampusDetailWebViewController : UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var detailView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        title = "iPhone app ontwikkelen"
    }
    
    override func viewDidLoad() {
        self.detailView.loadRequest(NSURLRequest(URL: NSURL(string: "https://projectcamp.us/projects/iphone-app-ontwikkelen")!))
    }
    
    override func viewDidLayoutSubviews() {
        detailView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
       // webView.stringByEvaluatingJavaScriptFromString("document.getElementById('search-bar').style.display = 'none'")
        //webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName('page-offset').style.paddingTop = '0'")
       // println("BAN")
    }
    

}
