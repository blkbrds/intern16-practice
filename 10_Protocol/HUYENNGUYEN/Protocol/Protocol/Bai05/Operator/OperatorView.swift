//
//  OperatorView.swift
//  Protocol
//
//  Created by bu on 8/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol OperatorViewDataSource: class {
    func getNumber1(operatorView: OperatorView) -> Int!
    func getNumber2(operatorView: OperatorView) -> Int!
}

protocol OperatorViewDelegate: class {
    func view(_ view: OperatorView, needsPerform action: OperatorView.Action)
}

class OperatorView: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var number1Label: UILabel!
    @IBOutlet private weak var number2Label: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Protocol
    var delegate: OperatorViewDelegate?
    var dataSource: OperatorViewDataSource?
    
    enum Action {
        case cancel
        case clear
        case done(result: Float)
    }
    
    enum Calculator: Int {
        case plus
        case substract
        case mutiply
        case divide
        case modulo
        case exponetial
    }
    
    // MARK: - Property
    private var number1 = 0, number2 = 0, result: Float = 0
    
    // MARK: - Action
    @IBAction func selectTouchUpInside(_ sender: UIButton) {
        if let dataSource = self.dataSource {
            guard let number1 = dataSource.getNumber1(operatorView: self) else { return }
            self.number1 = number1
            number1Label.text = "\(number1)"
            guard let number2 = dataSource.getNumber2(operatorView: self) else { return }
            self.number2 = number2
            number2Label.text = "\(number2)"
            resultLabel.text = "\(result)"
        }
    }
    
    @IBAction private func calculatorButtonsTouchUpInside(_ sender: UIButton) {
        guard let action = Calculator(rawValue: sender.tag - 1) else { return }
        switch action {
        case .plus:
            result = Float(number1 + number2)
        case .substract:
            result = Float(number1 - number2)
        case .mutiply:
            result = Float(number1 * number2)
        case .divide:
            result = Float(number1) / Float(number2)
        case .modulo:
            result = Float(number1 % number2)
        case .exponetial:
            result = pow(Float(number1), Float(number2))
        }
    }
    
    @IBAction private func cancelTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.view(self, needsPerform: .cancel)
    }
    
    @IBAction private func doneTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.view(self, needsPerform: .done(result: result))
    }
    
    @IBAction private func clearTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needsPerform: .clear)
    }
}
