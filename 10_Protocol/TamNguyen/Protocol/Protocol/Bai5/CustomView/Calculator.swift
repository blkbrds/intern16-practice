//
//  Calculator.swift
//  Protocol
//
//  Created by PCI0001 on 7/26/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol  CalculatorDataSource: class {
    func getNumberX() -> Int?
    func getNumberY() -> Int?
}

protocol CalculatorDelegate: class {
    func updateResult(view: Calculator, need action: Calculator.Action)
}

final class Calculator: UIView {
    
    // MARK: - IBOulets
    @IBOutlet private weak var numberXLabel: UILabel!
    @IBOutlet private weak var numberYLabel: UILabel!
    @IBOutlet private weak var resultLabal: UILabel!
    
    // MARK: - Properties
    weak var dataSource: CalculatorDataSource?
    weak var delegate: CalculatorDelegate?
    enum Action {
        case doneButton(resultText: String?, mathText: String?)
        case clearButton(clearText: String?)
    }
    enum Operand: Int {
        case add = 1
        case sub = 2
        case mul = 3
        case div = 4
    }
    let calculatorBrain = CalculatorBrain()
    //tao bien de unwrap cac ham trong trong datasource va gan gia tri voi cac label x,y
    private var x: Float?
    private var y: Float?
    private var result: Float?
    
    // MARK: - IBActions
    @IBAction private func calculatorButton(_ sender: UIButton) {
        let calculatorBrain = CalculatorBrain()
        
        guard let x = dataSource?.getNumberX(), let y = dataSource?.getNumberY() else { return }
        guard let operand = Operand(rawValue: sender.tag) else { return }
        
        switch operand {
        case .add:
            result = calculatorBrain.add(a: Float(x),b: Float(y))
        case .sub:
            result = calculatorBrain.sub(a: Float(x),b: Float(y))
        case .mul:
            result = calculatorBrain.mul(a: Float(x),b: Float(y))
        case .div:
            result = calculatorBrain.div(a: Float(x),b: Float(y))
        default:
            result = 0
        }
        guard let result = result else { return }
        resultLabal.text = String(result)
    }
    
    @IBAction private func clearButtonTouchUpInside(_sender: UIButton) {
        numberXLabel.text = ""
        numberYLabel.text = ""
        resultLabal.text = ""
        if let delegate = delegate {
            delegate.updateResult(view: self, need: .clearButton(clearText: ""))
        }
    }
    
    @IBAction private func doneButtonTouchUpInside(_ sender: UIButton) {
        sender.isHidden = true
        guard let result = result else { return }
        if let delegate = delegate {
            delegate.updateResult(view: self, need: .doneButton(resultText: String(result), mathText: "Hihi"))
        }
    }
    
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        sender.isHidden = true
    }
}
