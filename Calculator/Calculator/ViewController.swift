//
//  ViewController.swift
//  Calculator
//
//  Created by Carlos on 25/04/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    private var operations = CalculatorOperations()
    private var userTypingDigit = false;
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userTypingDigit {
            let textCurrentDisplay = display.text!
            display.text = textCurrentDisplay + digit
        }else{
            display.text = digit
        }
        userTypingDigit = true
        print("touched \(digit) digit")
        
    }
    
    @IBAction func executeOperation(_ sender: UIButton) {
        if userTypingDigit{
            operations.setOperand(operand: displayValue)
            userTypingDigit = false
        }
        
        if let mathSymbol = sender.currentTitle{
            operations.executeOperation(symbol: mathSymbol)
        }
        displayValue = operations.resultOperation
    }
}

