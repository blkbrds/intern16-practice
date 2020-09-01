//
//  Baitap1ViewController.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/30/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

final class Baitap1ViewController: UIViewController {

    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .null

    //model
    var calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let newCalculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView else { return }
        newCalculator.delegate = self
        newCalculator.datasource = self
        view.addSubview(newCalculator)
    }

    private func createRunningNumber(number: String) {
        if runningNumber.count <= 8 {
            if runningNumber == "0" {
                runningNumber = "\(number)"
            } else {
                runningNumber += "\(number)"
            }
            result = runningNumber
        }
    }

    private func dotButtonPressed() {
        if runningNumber.contains(".") {
        } else {
            if runningNumber.count <= 7 {
                runningNumber += "."
                result = runningNumber
            }
        }
    }

    private func clearNumber() {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .null
    }

    private func operation(operation: Operation) {
        if currentOperation != .null {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""

                if currentOperation == .add {
                    result = calculator.add(a: leftValue, b: rightValue)
                } else if currentOperation == .subtract {
                    result = calculator.sub(a: leftValue, b: rightValue)
                } else if currentOperation == .multiply {
                    result = calculator.mul(a: leftValue, b: rightValue)
                } else if currentOperation == .divide {
                    result = calculator.div(a: leftValue, b: rightValue)
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

// MARK: - CalculatorViewDelegate
extension Baitap1ViewController: CalculatorViewDelegate {
    func view(_ view: CalculatorView, needPerform action: CalculatorView.Action) {
        switch action {
        case .sendOperation(operation: let op):
            operation(operation: op)
        case .sendNumber(number: let num):
            createRunningNumber(number: num)
        case .clear:
            clearNumber()
        case .sendDot:
            dotButtonPressed()
        }
    }
}

// MARK: - CalculatorViewDatasource
extension Baitap1ViewController: CalculatorViewDatasource {
    func getResult(_view: CalculatorView) -> String? {
        return result
    }
}


