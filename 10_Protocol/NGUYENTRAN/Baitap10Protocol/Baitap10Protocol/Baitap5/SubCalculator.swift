//
//  SubCalculator.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol SubCalculatorDelegate: class {
    func send(_ view: SubCalculator, needsPerform action: SubCalculator.Action )
}

protocol SubCalculatorDataSource: class {
    func getValue() -> (x: String, y: String)?
}

@IBDesignable
class SubCalculator: UIView {
    
    weak var delegate: SubCalculatorDelegate?
    weak var datasource: SubCalculatorDataSource?

    @IBOutlet weak var xValueLabel: UILabel!
    @IBOutlet weak var yValueLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    
    var selectedTag : Int = 0
    var willSelectTag: Int = 0
    var calculator = Calculator()
    var operation: Operation = .null
    var result: String = "" {
        didSet {
            if result == "" {
                resultValueLabel.text = "0"
            } else {
                resultValueLabel.text = result
            }
        }
    }
    
    func getXAndY() {
        guard let data = datasource?.getValue() else { return }
        xValueLabel.text = data.x
        yValueLabel.text = data.y
    }
    
    func isSeleted(sender: UIButton) {
        let selectedButton = self.viewWithTag(selectedTag) as? UIButton
        selectedButton?.changeButtonState(isSelected: false, color: .white)
        let tag = sender.tag
        selectedTag = tag
        willSelectTag = tag
        sender.changeButtonState(isSelected: true, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    }
    
    @IBAction func addButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .add)
        isSeleted(sender: sender)
    }
    
    @IBAction func subtractButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .subtract)
        isSeleted(sender: sender)
    }
    
    @IBAction func multiplyButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .multiply)
        isSeleted(sender: sender)
    }
    
    @IBAction func divideButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .divide)
        isSeleted(sender: sender)
    }
    
    @IBAction func percentButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .percent)
        isSeleted(sender: sender)
    }
    

    @IBAction func powerButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .power)
        isSeleted(sender: sender)
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: RoundButton) {
        let selectedButton = self.viewWithTag(selectedTag) as? UIButton
        selectedButton?.changeButtonState(isSelected: false, color: .white)
        xValueLabel.text?.removeAll()
        yValueLabel.text?.removeAll()
        resultValueLabel.text?.removeAll()
        delegate?.send(self, needsPerform: .tapClear)
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        xValueLabel.text?.removeAll()
        yValueLabel.text?.removeAll()
        resultValueLabel.text?.removeAll()
        delegate?.send(self, needsPerform: .tapCancel)
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIButton) {
        xValueLabel.text?.removeAll()
        yValueLabel.text?.removeAll()
        resultValueLabel.text?.removeAll()
        delegate?.send(self, needsPerform: .tapDone(result: result))
    }
    
    func operation(operation: Operation) {
        guard let data = datasource?.getValue() else { return }
        switch operation {
        case .add:
            result = calculator.add(a: data.x, b: data.y)
        case .divide:
            result = calculator.div(a: data.x, b: data.y)
        case .multiply:
            result = calculator.mul(a: data.x, b: data.y)
        case .subtract:
            result = calculator.sub(a: data.x, b: data.y)
        case .power:
            result = calculator.power(a: data.x, b: data.y)
        case .percent:
            guard let z = resultValueLabel.text else {
                result = "Can not operation"
                return
            }
            result = calculator.percent(a: z)
        case .null:
            return
        }
    }
}

extension SubCalculator {
    enum Action {
        case tapDone(result: String)
        case tapCancel
        case tapClear
    }
}
