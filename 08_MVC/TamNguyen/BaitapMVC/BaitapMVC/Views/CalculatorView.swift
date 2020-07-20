//
//  CaculatorView.swift
//  BaitapMVC
//
//  Created by PCI0001 on 7/20/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class CalculatorView: UIView {
    
    // MARK: - Properties
    private var numberOnScreen: Float = 0
    private var previousNumber: Float = 0
    private var performMath: Bool = false
    private var operation: Int = 0
    
    // MARK: - IBOulet
    @IBOutlet private weak var currentValueLabel: UILabel!
    
    // MARK: - IBAction
    @IBAction private func clickNumbersTouchUpInside(_ sender: UIButton) { 
        if performMath {
            numberOnScreen = Float((sender.tag - 1))
            currentValueLabel.text = String(numberOnScreen)
            performMath = false
        } else {
            currentValueLabel.text = String(sender.tag - 1)
            guard let textValue = currentValueLabel.text, let valueLabel = Float(textValue) else { return }
            previousNumber = valueLabel
        }
    }
    
    @IBAction func clickCalculatorTouchUpInside(_ sender: UIButton) {
        if currentValueLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            //devide
            if sender.tag == 12 {
                currentValueLabel.text = "/"
            } else if sender.tag == 13 {
                currentValueLabel.text = "*"
            } else if sender.tag == 14 {
                currentValueLabel.text = "-"
            } else if sender.tag == 15 {
                currentValueLabel.text = "+"
            }
            performMath = true
            operation = sender.tag
        }
        else if sender.tag == 16 {
            let calculator = Calculator()
            if operation == 12 {
                currentValueLabel.text = String(calculator.divTwoNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 13 {
                currentValueLabel.text = String(calculator.mulTwoNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 14 {
                currentValueLabel.text = String(calculator.subTwoNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 15 {
                currentValueLabel.text = String(calculator.addTwoNumber(a: numberOnScreen, b: previousNumber))
            }
            guard let textValue = currentValueLabel.text, let valueLabel = Float(textValue) else { return }
            previousNumber = valueLabel
        } else if sender.tag == 11 {
            currentValueLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
