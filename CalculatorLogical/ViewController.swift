//
//  ViewController.swift
//  CalculatorLogical
//
//  Created by Tom Hoevers on 02/03/15.
//  Copyright (c) 2015 Toon van Dort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // update the array when the digits are fully typed in the 
    // textfield
    
    //  let the code know there is a textField to work with.
    //  the textfield displays a 0 on default
    @IBOutlet weak var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  make a variable for when a button is clicked
    var updateDigit = String()
    
    var userIsInTheMiddleOfTyping = false
    
    //  make a variable for the stack of digits and promts
    //  that have been put into the calculator (this might
    //  be solved using an array type based on strings)
    var ansStack = Array<String>()
    var numStack = Array<String>()
    
    //  when a digit is pressed it should update the textField
    //  to the digit that has been pressed and this should also
    //  update the ansStack!!
    @IBAction func digit(onClick: UIButton!) {
        updateDigit = onClick.currentTitle!
        numStack.append(onClick.currentTitle!)
        textField.text! = updateDigit
        userIsInTheMiddleOfTyping = true
        println(numStack)
        println(ansStack)
//        for var i = 0; i < ansStack.count; ++i {
//            ansStack[i]
//        }
    }
  
    
    //  this is the "C" button that resets the calculor
    //  it won't do anything else other than reset the
    //  textField to 0
    @IBAction func resetButton(resetClick: UIButton!) {
        textField.text = "0"
        numStack.removeAll(keepCapacity: false)
        ansStack.removeAll(keepCapacity: false)
    }
    
    //  this function will check which prompt has been used
    //  then update the textfield to display the entire 
    //  calculation
    @IBAction func functionOp(operate: UIButton!) {
    
    //  Make a switch that handles all the prompts in its
    //  cases and output the current "prompt-title", this
    //  didnt work like it should
//        switch operate {
//            case operate.currentTitle! == "+":
//                println( operate.currentTitle! )
//            case operate.currentTitle == "-":
//                println( operate.currentTitle! )
//            case operate.currentTitle == "÷":
//                println( operate.currentTitle! )
//            case operate.currentTitle == "×":
//                println( operate.currentTitle! )
//            case operate.currentTitle == "√":
//                println( operate.currentTitle! )
//        default: break
//    }
        func whenOperatorIsUsed() {
            userIsInTheMiddleOfTyping = false
            ansStack += numStack
            numStack.removeAll(keepCapacity: false)
            ansStack.append(operate.currentTitle!)
        }
        
        
        //  if the button of a certain prompt is clicked it
        //  should update the ansStack and give a result for
        //  the calculation
        if operate.currentTitle! == "+" {
            whenOperatorIsUsed()
        }
        else if operate.currentTitle! == "-" {
            whenOperatorIsUsed()
        }
        
        else if operate.currentTitle! == "÷" {
            whenOperatorIsUsed()
        }
        
        else if operate.currentTitle! == "×" {
            whenOperatorIsUsed()
        }
        
        else if operate.currentTitle! == "√" {
            whenOperatorIsUsed()
        }
        
        
    }
}
