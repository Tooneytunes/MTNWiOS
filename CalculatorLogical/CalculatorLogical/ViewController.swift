//
//  ViewController.swift
//  CalculatorLogical
//
//  Created by Toon van Dort on 02/03/15.
//  Copyright (c) 2015 Toon van Dort. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    // Input from textField. The label that displays 0 on default
    @IBOutlet weak var textField: UILabel!
   
    // Check when the user is in the middle of typing BOOLEAN type
    var userIsInTheMiddleOfTyping = false
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    
    //  make a variable for when a button is clicked
    var updateDigit = String()
    
    var displayTotal = ""
    
    //  when a digit is pressed it should update the textField
    //  to the digit that has been pressed and this should also
    //  update the ansStack!!
    
    @IBAction func digit(onClick: UIButton!) {
        //updateDigit = onClick.currentTitle!
        //numStack.append(onClick.currentTitle!)
        
        //Set the total of displayed numbers to a stack
        displayTotal += "\(onClick.currentTitle!)"
        println(displayTotal)
        
        
        //Display the value in the textfield
        var number = onClick.currentTitle
        if userIsInTheMiddleOfTyping {
            textField.text = textField.text! + number!
        }
        else {
            textField.text! = number!
            userIsInTheMiddleOfTyping = true
        }
    }
    
    // Input from resetButton. Reset the array when clicked
    @IBAction func resetButton(sender: UIButton) {
        displayTotal.removeAll(keepCapacity: false)
        textField.text! = ("0")
    }
    
    // Check for what operator has been tapped then updates the array
    @IBAction func operatorTapped(sender: AnyObject) {
        userIsInTheMiddleOfTyping = false
        firstNumber = textField.text!.toInt()!
        operation = sender.currentTitle!!
        switch("\(sender.currentTitle)") {
            case "Optional(\"+\")":
            displayTotal += " + "
            case "Optional(\"−\")":
            displayTotal += " − "
            case "Optional(\"÷\")":
            displayTotal += " / "
            case "Optional(\"×\")":
            displayTotal += " × "
            default:
            displayTotal += "\(sender.currentTitle)"
        }
        textField.text! = displayTotal
        println(displayTotal)
    }
    
    
    // Checks when equals has been tapped then updates the array
    // also init's the solution and updates textfield to the solution
    @IBAction func equalsTapped(sender: AnyObject) {
        userIsInTheMiddleOfTyping = false
        var result = 0
       secondNumber = textField.text!.toInt()!
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        } else if operation == "÷" {
            result = (secondNumber/firstNumber)
        } else if operation == "×" {
            result = firstNumber * secondNumber
        }
        textField.text = "\(result)"
    }
    
    // Generic Auto-written code for launching
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}