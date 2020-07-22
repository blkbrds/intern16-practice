//
//  CalculatorView.swift
//  BaiTap08
//
//  Created by PCI0020 on 7/7/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class CalculatorView: UIView {

    @IBOutlet private weak var resultView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!

    var operand: Operand = Operand(operands: [])
    var operatorCurrent: Int?
    var isNewNumber: Bool = true
    var isNewOperator: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultView.layer.borderWidth = 1
        resultView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        resultLabel.text = "0"
    }
    
    @IBAction private func operandButtonTouchUpInside(_ sender: Any) {
        let number: Int = (sender as AnyObject).tag as Int
        if resultLabel.text == "0" || !isNewNumber {
            resultLabel.text = String(number)
            isNewNumber = true
        } else if isNewNumber, let result = resultLabel.text {
            resultLabel.text = result + String(number)
        }
        isNewOperator = false
    }

    @IBAction private func calculatorButtonTouchUpInside(_ sender: Any) {
        let number = (sender as AnyObject).tag
        if var resultString = resultLabel.text, let resultInt = Int(resultString),let operandLast: Int = operand.operands.last {
            switch number {
                case 10:
                    // ==
                    if !isNewOperator {
                        operand.operands.append(resultInt)
                        isNewNumber = false
                        isNewOperator = true
                        if let operatorCurrent = operatorCurrent {
                            guard let result: Int = Calculator.shared().operatorCal(a: operand.result, b: operandLast, operatorCurrent: operatorCurrent) else {
                                resultLabel.text = "Error"
                                operand.result = 0
                                return
                            }
                            resultLabel.text = String(result)
                            operand.result = result
                        } else {
                            operand.result = resultInt
                        }
                    }
                    return
                case 11:
                    // AC
                    if resultString.count > 1 {
                        resultString.removeLast()
                        resultLabel.text = resultString
                        operand.result = resultInt
                    } else {
                        resultLabel.text = "0"
                        operand.result = 0
                    }
                    return
                case number:
                    // add
                    if !isNewOperator {
                        operand.operands.append(resultInt)
                        print(operand.operands)
                        print(isNewOperator)
                        isNewNumber = false
                        isNewOperator = true
                        if let operatorCurrent = operatorCurrent {
                            guard let result: Int = Calculator.shared().operatorCal(a: operand.result, b: operandLast, operatorCurrent: operatorCurrent) else {
                            resultLabel.text = "Error"
                            operand.result = 0
                                return }
                            resultLabel.text = String(result)
                            operand.result = result
                        } else {
                            operand.result = resultInt
                        }
                    }
                    operatorCurrent = number
                    return
                case .none, .some(_):
                    return
                }
        }
    }
}
