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
    @IBOutlet private weak var currentValueFloat: UILabel!
    
    // MARK: - IBAction
    @IBAction private func clickNumbersTouchUpInside(_ sender: UIButton) { 
        if performMath {
            numberOnScreen = Float((sender.tag - 1))
            currentValueFloat.text = String(numberOnScreen)
            performMath = false
        } else {
            currentValueFloat.text = String(sender.tag - 1)
            guard let textValue = currentValueFloat.text, let valueLabel = Float(textValue) else { return }
            previousNumber = valueLabel
        }
    }
    
    @IBAction private func clickCalculatorTouchUpInside(_ sender: UIButton) {
        guard let valueText = currentValueFloat.text else { return }
        if !valueText.isEmpty && sender.tag != 11 && sender.tag != 16 {
            //devide
            switch sender.tag {
            case 12:
                currentValueFloat.text = "/"
            case 13:
                currentValueFloat.text = "*"
            case 14:
                currentValueFloat.text = "-"
            case 15:
                currentValueFloat.text = "+"
            default:
                currentValueFloat.text = "0"
            }
            performMath = true
            operation = sender.tag
        } else if sender.tag == 16 {
            let calculator = Calculator()
            switch operation {
            case 12:
                currentValueFloat.text = String(calculator.divTwoNumber(a: previousNumber, b: numberOnScreen))
            case 13:
                currentValueFloat.text = String(calculator.mulTwoNumber(a: previousNumber, b: numberOnScreen))
            case 14:
                currentValueFloat.text = String(calculator.subTwoNumber(a: previousNumber, b: numberOnScreen))
            default:
                currentValueFloat.text = String(calculator.addTwoNumber(a: numberOnScreen, b: previousNumber))
                guard let textValue = currentValueFloat.text, let valueLabel = Float(textValue) else { return }
                previousNumber = valueLabel
            }
        } else if sender.tag == 11 {
            currentValueFloat.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
