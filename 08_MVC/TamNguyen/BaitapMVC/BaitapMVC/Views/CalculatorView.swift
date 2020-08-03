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
    enum Operand: Int {
        case add = 15
        case subtract = 14
        case multiply = 13
        case divide = 12
        case equal = 16
        case clear = 11
    }
    
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
        if !valueText.isEmpty && sender.tag != Operand.clear.rawValue && sender.tag != Operand.equal.rawValue {
            //devide
            switch sender.tag {
            case Operand.divide.rawValue:
                currentValueFloat.text = "/"
            case Operand.multiply.rawValue:
                currentValueFloat.text = "*"
            case Operand.subtract.rawValue:
                currentValueFloat.text = "-"
            case Operand.add.rawValue:
                currentValueFloat.text = "+"
            default:
                currentValueFloat.text = "0"
            }
            performMath = true
            operation = sender.tag
        } else if sender.tag == Operand.equal.rawValue {
            let calculator = Calculator()
            switch operation {
            case Operand.divide.rawValue:
                currentValueFloat.text = String(calculator.divTwoNumber(a: previousNumber, b: numberOnScreen))
            case Operand.multiply.rawValue:
                currentValueFloat.text = String(calculator.mulTwoNumber(a: previousNumber, b: numberOnScreen))
            case Operand.subtract.rawValue:
                currentValueFloat.text = String(calculator.subTwoNumber(a: previousNumber, b: numberOnScreen))
            default:
                currentValueFloat.text = String(calculator.addTwoNumber(a: numberOnScreen, b: previousNumber))
                guard let textValue = currentValueFloat.text, let valueLabel = Float(textValue) else { return }
                previousNumber = valueLabel
            }
        } else if sender.tag == Operand.clear.rawValue {
            currentValueFloat.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
