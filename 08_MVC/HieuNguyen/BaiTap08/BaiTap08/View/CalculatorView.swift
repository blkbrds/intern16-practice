//
//  CalculatorView.swift
//  BaiTap08
//
//  Created by PCI0020 on 7/7/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
    
    var operand: Operand = Operand(operands: [])
    var operatorCurrent: Int?
    var newNumber: Bool = true
    var newOperator: Bool = false
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func operandWasPressed(_ sender: Any) {
        let number: Int = (sender as AnyObject).tag as Int
        if resultLabel.text == "0" || !newNumber {
            resultLabel.text = String(number)
            newNumber = true
        } else if newNumber {
            resultLabel.text = resultLabel.text! + String(number)
        }
        newOperator = false
    }

    @IBAction func calculatorWasPressed(_ sender: Any) {
        let number = (sender as AnyObject).tag
        switch (sender as AnyObject).tag {
            case 10:
                // result
                if !newOperator {
                    operand.operands.append(Int(resultLabel.text!)!)
                    newNumber = false
                    if operatorCurrent != nil {
                        let result: Int = Calculator.shared().operatorCal(a: operand.result, b: operand.operands.last!, operatorCurrent: operatorCurrent!)
                        resultLabel.text = String(result)
                        operand.result = result
                        newOperator = true
                    } else {
                        operand.result = Int(resultLabel.text!)!
                    }
                }
            case 11:
                // AC
                print("123")
                if resultLabel.text!.count > 0 {
                    resultLabel.text!.removeLast()
                }
                if resultLabel.text!.count == 0 {
                    resultLabel.text = "0"
                }
            case number:
                // add
                if !newOperator {
                    operand.operands.append(Int(resultLabel.text!)!)
                    newNumber = false
                    if operatorCurrent != nil {
                        let result: Int = Calculator.shared().operatorCal(a: operand.result, b: operand.operands.last!, operatorCurrent: operatorCurrent!)
                        resultLabel.text = String(result)
                        operand.result = result
                        newOperator = true
                    } else {
                        operand.result = Int(resultLabel.text!)!
                    }
                }
                operatorCurrent = number
            case .none, .some(_):
                return
            }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultView.layer.borderWidth = 1
        resultView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        resultLabel.text = "0"
    }
}
