//
//  CustomViewCalculate.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 8/4/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol CalculatorDelegate: class {
    func updateValue(_ view: CustomViewCalculate, needPerform action: CustomViewCalculate.Action)
}

protocol CalculatorDataSource: class {
    func getNumberX() -> Int?
    func getNumberY() -> Int?
}

final class CustomViewCalculate: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var numberXLabel: UILabel!
    @IBOutlet private weak var numberYLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: - Properties
    enum Operand: Int {
        case add = 1
        case subtract = 2
        case multiply = 3
        case divide = 4
        case modulo = 5
        case exponetial = 6
    }
    enum Action {
        case cancelButton
        case doneButton(resultText: String?)
        case clearButton
    }

    weak var dataSource: CalculatorDataSource?
    weak var delegate: CalculatorDelegate?
    private var result: Float = 0.0

    // MARK: - IBActions
    @IBAction private func calculatorButton(_ sender: UIButton) {
        guard let x = dataSource?.getNumberX(), let y = dataSource?.getNumberY() else { return }
        numberXLabel.text = String(x)
        numberYLabel.text = String(y)
        let calculator = Calculator(a: Float(x), b: Float(y))
        guard let operand = Operand(rawValue: sender.tag) else { return }

        switch operand {
        case .add:
            result = calculator.add()
        case .subtract:
            result = calculator.subtract()
        case .multiply:
            result = calculator.multiply()
        case .divide:
            result = calculator.divide()
        case .modulo:
            result = Float(x % y)
        case .exponetial:
            result = calculator.exponetial()
        default:
            result = 0
        }
        resultLabel.text = String(result)
    }
    
    @IBAction private func CancelButtonTouchUpInside(_ sender: UIButton) {
        delegate?.updateValue(self, needPerform: Action.cancelButton)
    }
    
    @IBAction private func DoneButtonTouchUpInside(_ sender: UIButton) {
        delegate?.updateValue(self, needPerform: Action.doneButton(resultText: String(result)))
    }
    
    @IBAction private func ClearButtonTouchUpInside(_ sender: UIButton) {
        delegate?.updateValue(self, needPerform: Action.clearButton)
    }
}
