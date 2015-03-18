//
//  ViewController.swift
//  webViewer
//
//  Created by Johan van der Meulen & Toon van Dort on 02/03/15.
//  Copyright (c) 2015 Johan van der Meulen & Toon van Dort. All rights reserved.
//

//  THINGS YET TO BE MADE:
//  !!! ADD AN ARRAY THAT SAVES ALL THE URLS THAT HAVE BEEN
//  TYPED IN SO YOU CAN MAKE A HISTORY BAR SOMEWHERE.
//  !!! MAKE THE HOMEBUTTON GOTO A STRING THAT CAN BE SET IN
//  THE SETTINGS BAR, IF NOT SET GOTO GOOGLE.COM
//  !!! ON REFRESH TAKE THE LATEST INPUT FROM THE ARRAY OF
//  URL'S THAT HAVE BEEN TYPED IN. AND CHECK IF THESE ARE
//  EVEN CORRECT URL'S
//  !!! ON THE BACKWARDS BUTTON MAKE IT GOTO THE LAST ARRAY
//  TYPED URL IF THIS WAS CORRECTLY WRITTEN
//  !!! ON FORWARD MAKE IT GOTO THE NEXT TYPE SET IN THE
//  ARRAY, IF THIS IS NOT SET THEN MAKE THE FORWARD BUTTON
//  EITHER INVISIBLE OR GREY

import UIKit


class ViewController: UIViewController, UIWebViewDelegate {
    
    var historyArray = Array<String>()
    
    //Initialize the URL bar
    @IBOutlet weak var inputBar: UITextField!
    
    //Initialize the webview on load 
    //!!! optional: add a placeholder?, when opening  
    //the webbrowser make it automaticly go to google
    //in default opening state
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
    
    //Activating the load indicator.
    func webViewDidStartLoad(uiWebView: UIWebView)
    {
        println("startLoading")
        loadIndicator.startAnimating()
    }
    
    //Stop the animation when a webpage is fully loaded
    func webViewDidFinishLoad(uiWebView: UIWebView) {
        println("finishedLoading")
        loadIndicator.stopAnimating()
    }
    
    //Checking for corrected URL it does this by checking
    //if the first few letters are "www.", if so then it will
    //add "http://" to the url so you wont have to do this
    //manually
    func checkForCorrectURL (inputText :String)->String? {
        var urlString : String = inputText
        let urlChar = Array(urlString)
        if urlChar.count > 0
        {
            if urlChar[0] == "w" && urlChar[1] == "w" && urlChar[2] == "w" && urlChar[3] == "." {
                urlString = "https://" + urlString
                historyArray.append(urlString)
                println(historyArray)
            }
            
            else if urlChar[0] == "h" && urlChar[5] == ":" && urlChar[7] == "/" {
                return urlString
            }
            
            else
            {
                //Creating a wrong URL alert without typing
                //www. means you have to manually add it?
                //!!! optional: Have the code add http://www.
                //if this is not typed. (should this fix the
                //problem?
//                let wrongURLAlert = UIAlertView()
//                wrongURLAlert.title = "Oops!"
//                wrongURLAlert.message = "At least ad www. to your url"
//                wrongURLAlert.addButtonWithTitle("Ok I will senpai")
//                wrongURLAlert.show()
//                return nil
                urlString = "http://www." + urlString
                historyArray.append(urlString)
                println(historyArray)
            }
            return urlString
        }
        else
        {
            //Creating a wrong URL alert without even 
            //typing anything in the url field
            let wrongURLAlert = UIAlertView()
            wrongURLAlert.title = "TextBar is empty"
            wrongURLAlert.message = "please type an URL"
            wrongURLAlert.addButtonWithTitle("Ok")
            wrongURLAlert.show()
        }
        
        //If there is an error, make the webview return
        //nothing instead of an error, preventing the
        //webbrowser from crashing
        
        //Creating a wrong URL alert without even
        //typing anything in the url field
        return nil
    }
    
    //Opening the entire View, making the application
    //load when its opened!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Opening application")
    }
    
    //Load the homepage, if not set load google on default
    @IBAction func buttonHome(inputText: UIButton) {
        var homeUrl = NSURL(string: "http://www.google.com")
        var homeReq = NSURLRequest(URL:homeUrl!)
        uiWebView!.loadRequest(homeReq)
    }
    
    //The stoploading buttong makes the load icon dissapear
    //and makes the current typed url invalid setting the
    //textfield in the UIWebView say that you stopped loading
    //the current typed url
    @IBAction func stopLoading(sender: UIBarButtonItem) {
        uiWebView?.stopLoading()
    }
    
    //Foward button taking the next typed url from an Array
    //Then fils this in into the uiWebView. If there is no
    //next entry in the array make it either invisible or 
    //greyscaled
    @IBAction func forwardButton(sender: UIBarButtonItem) {
        uiWebView!.goForward()
    }
    
    //Back button taking the last typed url from an Array
    //Then fills this in into the uiWebView. If there is no
    //last entry make it either invisible or greyscaled and
    //unfunctional
    @IBAction func backwardButton(sender: UIBarButtonItem) {
        uiWebView?.goBack()
    }
    
    //Load the current Array typed URL back into
    //the UIWebView and doesnt add this another time to the
    //Array!
    @IBAction func refreshButton(sender: UIBarButtonItem) {
        uiWebView?.reload()
    }
}

