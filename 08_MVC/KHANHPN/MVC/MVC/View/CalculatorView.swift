//
//  CalculatorView.swift
//  MVC
//
//  Created by PCI0007 on 7/15/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class CalculatorView: UIView {
    
    // MARK: - Outlets
    @IBOutlet private weak var resultLabel: UILabel!
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var text: String = ""

    // MARK: - Actions
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        resultLabel.text = ""
        if performingMath == true {
            resultLabel.text = String(sender.tag)
            guard let number = resultLabel.text, let nb = Double(number) else { return }
            numberOnScreen = nb
            performingMath = false
        } else {
            text = text + String(sender.tag)
            resultLabel.text = text
            guard let number1 = resultLabel.text, let nb1 = Double(number1) else { return }
            previousNumber = nb1
        }
    }

    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        let calculator = Calculate()
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 12 {
            if sender.tag == 13 {
                resultLabel.text = "+";
            }
            if sender.tag == 14 {
                resultLabel.text = "-";
            }
            if sender.tag == 15 {
                resultLabel.text = "x";
            }
            if sender.tag == 16 {
                resultLabel.text = "/";
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 11 {
            text = ""
            resultLabel.text = "0"
            numberOnScreen = 0
        }
        else if sender.tag == 12 {
            switch operation {
            case 13:
                resultLabel.text = String(calculator.add(a: previousNumber, b: numberOnScreen))
            case 14:
                resultLabel.text = String(calculator.sub(a: previousNumber, b: numberOnScreen))
            case 15:
                resultLabel.text = String(calculator.mul(a: previousNumber, b: numberOnScreen))
            case 16:
                resultLabel.text = String(calculator.div(a: previousNumber, b: numberOnScreen))
            default:
                return
            }
            guard let number = resultLabel.text,let nb = Double(number) else { return }
            previousNumber = nb
        }
    }
}
