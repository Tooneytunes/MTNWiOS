//
//  ViewController.swift
//  webViewer
//
//  Created by Johan van der Meulen on 02/03/15.
//  Copyright (c) 2015 Johan van der Meulen. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var inputBar: UITextField!
    
    @IBOutlet weak var uiWebView: UIWebView?
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    @IBAction func urlButtonPressed(sender: UIButton) {
        var test = "testing"
        
        
        //Checking if the string starts with HTTP
        let correctedUrl = checkForCorrectURL(inputBar.text!)
        
        if correctedUrl != nil
        {
            //Converting the string to an URL and URLRequest
            var url = NSURL(string: correctedUrl!)
            var req = NSURLRequest(URL: url!)
            //Adjusting the webpage
            uiWebView!.scalesPageToFit = true
            //Loading the URL
            uiWebView?.delegate = self
            uiWebView!.loadRequest(req)
        }
    }
    
    //activating the load indicator.
    func webViewDidStartLoad(uiWebView: UIWebView)
    {
        println("startLoading")
        loadIndicator.startAnimating()
    }
    func webViewDidFinishLoad(uiWebView: UIWebView) {
        println("finishedLoading")
        loadIndicator.stopAnimating()
    }
    
    //Checking for corrected URL
    func checkForCorrectURL (inputText :String)->String?
    {
        var urlString : String = inputText
        let urlChar = Array(urlString)
        
        if (urlChar.count > 0)
        {
            if urlChar[0] == "w" && urlChar[3] == "."
            {
                urlString = "https://" + urlString
            }
            else if urlChar[0] == "h" && urlChar[5] == ":" && urlChar[7] == "/"
            {
                return urlString
            }
            else
            {
                //Creating a wrong URL alert
                let wrongURLAlert = UIAlertView()
                wrongURLAlert.title = "Congratulations!"
                wrongURLAlert.message = "You can't type a URL"
                wrongURLAlert.addButtonWithTitle("I'm a moron")
                wrongURLAlert.show()
                return nil
            }
            
            return urlString
        }
        else
        {
            //Creating a wrong URL alert
            let wrongURLAlert = UIAlertView()
            wrongURLAlert.title = "TextBar is empty"
            wrongURLAlert.message = "please type a URL"
            wrongURLAlert.addButtonWithTitle("Ok")
            wrongURLAlert.show()
        }
        
        return nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Opening application")
    }
    
    
}

