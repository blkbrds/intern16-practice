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
    func getValue(_ view: SubCalculator) -> (String?, String?)
}

@IBDesignable
class SubCalculator: UIView {
    
    weak var delegate: SubCalculatorDelegate?
    weak var datasource: SubCalculatorDataSource?

    @IBOutlet weak var xValueLabel: UILabel!
    @IBOutlet weak var yValueLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    @IBAction func percentButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .percent)
    }
    

    @IBAction func powerButtonTouchUpInside(_ sender: RoundButton) {
        operation(operation: .power)
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        delegate?.send(self, needsPerform: .tapClear)
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        delegate?.send(self, needsPerform: .tapCancel)
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIButton) {
        delegate?.send(self, needsPerform: .tapDone(result: result))
    }
    
    func operation(operation: Operation) {
        guard let x = xValueLabel.text, let y = yValueLabel.text  else { return }
        switch operation {
        case .add:
            result = calculator.add(a: x, b: y)
        case .divide:
            result = calculator.div(a: x, b: y)
        case .multiply:
            result = calculator.mul(a: x, b: y)
        case .subtract:
            result = calculator.sub(a: x, b: y)
        case .power:
            result = calculator.power(a: x, b: y)
        case .percent:
            guard let z = resultValueLabel.text else {
                result = "Can not operation"
                return
            }
            result = calculator.percent(a: z)
        case .null:
            return
        }
        if (Float(result)!.truncatingRemainder(dividingBy: 1) == 0) {
            result = "\(Int(Float(result)!))"
        }
    }
    
    func getXAndY() {
        guard let x = datasource?.getValue(self).0, let y = datasource?.getValue(self).1 else { return  }
        xValueLabel.text = x
        yValueLabel.text = y
    }
}

extension SubCalculator {
    enum Action {
        case tapDone(result: String)
        case tapCancel
        case tapClear
    }
}
