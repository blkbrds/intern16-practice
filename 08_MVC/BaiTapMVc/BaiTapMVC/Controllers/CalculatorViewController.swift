//
//  CalculatorViewController.swift
//  BaiTapMVC
//
//  Created by PCI0004 on 7/20/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var displayLabel: UILabel!

    // MARK: - Properties
    var checkMath: Bool = false
    var previousNumber: Float = 0.0
    var numberOnScreen: Float = 0.0
    var numberTag: Int = 0
    enum Operand: Int {
        case ac = 11
        case add = 12
        case subtract = 13
        case multiply = 14
        case divide = 15
        case equal = 16
    }

    // MARK: - IBActions
    @IBAction private func numbers(_ sender: UIButton) {
        if checkMath == true {
            displayLabel.text = String(sender.tag - 1)
            guard let temp = displayLabel.text else { return }
            numberOnScreen = Float(temp) ?? 0.0
            checkMath = false
        } else {
            guard let temp = displayLabel.text else { return }
            displayLabel.text = temp + String(sender.tag - 1)
            numberOnScreen = Float(displayLabel.text ?? "") ?? 0.0
        }
    }

    @IBAction private func procesValue(_ sender: UIButton) {
        let calculator = Calculator(a: previousNumber, b: numberOnScreen)
        if displayLabel.text != "" && sender.tag != Operand.ac.rawValue && sender.tag != Operand.equal.rawValue {

            guard let temp = displayLabel.text else { return }
            previousNumber = Float(temp) ?? 0.0

            if sender.tag == Operand.add.rawValue { //Cong
                displayLabel.text = "+"
            } else if sender.tag == Operand.subtract.rawValue { // Tru
                displayLabel.text = "-"
            } else if sender.tag == Operand.multiply.rawValue { // Nhan
                displayLabel.text = "*"
            } else if sender.tag == Operand.divide.rawValue { // Chia
                displayLabel.text = "/"
            }

            numberTag = sender.tag
            checkMath = true
        } else if sender.tag == Operand.equal.rawValue {

            if numberTag == Operand.add.rawValue {
                displayLabel.text = String(calculator.add())
            } else if numberTag == Operand.subtract.rawValue {
                displayLabel.text = String(calculator.subtract())
            } else if numberTag == Operand.multiply.rawValue {
                displayLabel.text = String(calculator.multiply())
            } else if numberTag == Operand.divide.rawValue {
                displayLabel.text = String(calculator.divide())
            }

        } else if sender.tag == Operand.ac.rawValue {
            displayLabel.text = ""
            numberOnScreen = 0.0
            previousNumber = 0.0
            numberTag = 0
        }
    }
}
