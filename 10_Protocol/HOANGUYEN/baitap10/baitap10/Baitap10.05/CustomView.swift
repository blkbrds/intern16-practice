//
//  CustomView.swift
//  baitap10
//
//  Created by NXH on 7/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

// MARK: - protocol
protocol CustomViewDelegate: class {
    func view(_ view: CustomView, needsPerform action: CustomView.Action)
}

protocol CustomViewDataSource: class {
    func getXY() -> (x: Float, y: Float)?
}


final class CustomView: UIView {
    
    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var topUIView: UIView!
    
    // MARK: - Properties
    weak var delegate: CustomViewDelegate?
    weak var dataSource: CustomViewDataSource?
    private var calculator: Calculator?
    private var previousButton: UIButton = UIButton()
    private var operatorE: OperatorStruct.operatorEnum?
    
    // MARK: Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
        configTopUIView()
    }
    
    // MARK: - private func
    private func configTopUIView() {
        topUIView.layer.borderWidth = 1
        topUIView.layer.borderColor = UIColor.blue.cgColor
    }
    
    // MARK: - public func
    func getXY() {
        guard let x = dataSource?.getXY()?.x else { return }
        xLabel.text = String(x)
        guard let y = dataSource?.getXY()?.y else { return }
        yLabel.text = String(y)
    }
    
    // MARK: - @IBAction
    @IBAction func cancelButtonTouchUpInside() {
        UIView.transition(with: self, duration: 0.5, animations: {
            self.frame.origin.y = self.frame.origin.y + self.frame.height
        }, completion: nil)
    }
    
    @IBAction func doneButtonTouchUpInside() {
        guard let x = dataSource?.getXY()?.x, let y = dataSource?.getXY()?.y, let operatorSelect = operatorE else {
            return
        }
        
        calculator = Calculator(number1: x, number2: y, ope: operatorSelect)
        guard let result = result else { return }
        resultLabel.text = String(result.clean)
        delegate?.view(self, needsPerform: .tapOnDoneButton)
    }
    
    @IBAction func operatorsButtonTouchUpInside(_ sender: UIButton) {
        previousButton.backgroundColor = .systemYellow
        switch sender.tag {
        case 1:
            operatorE = .plus
        case 2:
            operatorE = .minus
        case 3:
            operatorE = .mul
        case 4:
            operatorE = .div
        case 5:
            operatorE = .percent
        default:
            operatorE = .pow
        }
        sender.backgroundColor = .green
        previousButton = sender
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        xLabel.text = ""
        yLabel.text = ""
        resultLabel.text = ""
        result = nil
        previousButton.backgroundColor = .systemYellow
        operatorE  = OperatorStruct.operatorEnum.none
        delegate?.view(self, needsPerform: .tapOnClear)
    }
}

extension CustomView {
    enum Action {
        case tapOnDoneButton
        case tapOnClear
    }
}
