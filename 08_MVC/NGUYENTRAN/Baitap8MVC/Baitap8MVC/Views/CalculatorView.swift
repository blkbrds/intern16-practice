//
//  CalculatorView.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/31/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class CalculatorView: UIView {

    @IBOutlet weak var resultLabel: UILabel!

    var runningNumber = ""
    var currentResult = ""
    var leftValue = ""
    var rightValue = ""
    var currentOperation: Operation = .null
    var calculator = Calculator()

    var result: String = "" {
        didSet {
            if result == "" {
                resultLabel.text = "0"
            } else {
                resultLabel.text = result
            }
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.text = "0"
    }


    @IBAction func numberButtonTouchUpInside(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            if runningNumber == "0" {
                runningNumber = "\(sender.tag)"
            } else {
                runningNumber += "\(sender.tag)"
            }
            currentResult = runningNumber
            result = currentResult
        }
    }

    @IBAction func clearButtonTouchUpInside(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentResult = ""
        currentOperation = .null
    }

    @IBAction func dotButtonTouchUpInside(_ sender: RoundButton) {
        if runningNumber.contains(".") {

        } else {
            if runningNumber.count <= 7 {
                runningNumber += "."
                currentResult = runningNumber
                result = currentResult
            }
        }
    }

    @IBAction func equalButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }

    @IBAction func addButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .add)
    }

    @IBAction func subtractButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .subtract)
    }

    @IBAction func multiplyButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .multiply)
    }

    @IBAction func divideButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .divide)
    }

    func operation(operation: Operation) {
        if currentOperation != .null {
            if runningNumber != "" {
                rightValue = runningNumber
                currentResult = runningNumber
                runningNumber = ""

                if currentOperation == .add {
                    result = "\(Float(leftValue)! + Float(rightValue)!)"
                } else if currentOperation == .subtract {
                    result = "\(Float(leftValue)! - Float(rightValue)!)"
                } else if currentOperation == .multiply {
                    result = "\(Float(leftValue)! * Float(rightValue)!)"
                } else if currentOperation == .divide {
                    result = "\(Float(leftValue)! / Float(rightValue)!)"
                }
                    leftValue = result
                if (Float(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Float(result)!))"
                }
                currentOperation = operation
            }
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}
