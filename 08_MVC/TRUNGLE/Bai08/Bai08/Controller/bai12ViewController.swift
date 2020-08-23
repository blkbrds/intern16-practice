//
//  bai12ViewController.swift
//  BaiTap07
//
//  Created by Abcd on 7/15/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class bai12ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Properties
    private var endEditing: Bool = true
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot covert text to Double")
            }
            return number
        } set {
            displayLabel.text = String(newValue)
        }
    }
    // MARK: - IBAction
    private var calculator = CalculatorLogic()
    @IBAction func calcButton(_ sender: UIButton) {
        endEditing = true
        calculator.setNumber(displayValue)
        if let calMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result
            }
        }
    }
    @IBAction func numberButton(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if endEditing  {
                displayLabel.text = String(number)
                endEditing = false
            }
            else {
                let isInt = floor(displayValue) == displayValue
                if number != "." || (number == "." && isInt) {
                    displayLabel.text = displayLabel.text! + number
                }
            }
        }
    }
}



