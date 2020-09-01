//
//  CalculatorView.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/31/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol CalculatorViewDelegate: class {
    func view(_ view: CalculatorView, needPerform action: CalculatorView.Action)
}

protocol CalculatorViewDatasource: class {
    func getResult(_view: CalculatorView) -> String?
}

class CalculatorView: UIView {

    @IBOutlet weak var resultLabel: UILabel!
    
    weak var delegate: CalculatorViewDelegate?
    weak var datasource: CalculatorViewDatasource?

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
        resultLabel.clipsToBounds = true
        resultLabel.adjustsFontSizeToFitWidth = true
    }

    @IBAction func numberButtonTouchUpInside(_ sender: RoundButton) {
        let number = "\(sender.tag)"
        delegate?.view(self, needPerform: .sendNumber(number: number))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func clearButtonTouchUpInside(_ sender: RoundButton) {
        delegate?.view(self, needPerform: .clear)
        guard let newResult = datasource?.getResult(_view: self) else {return}
               result = newResult
    }

    @IBAction func dotButtonTouchUpInside(_ sender: RoundButton) {
        delegate?.view(self, needPerform: .sendDot)
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func equalButtonTouchUpInside(_ sender: RoundButton) {
        let operation: Operation = .null
        delegate?.view(self, needPerform: .sendOperation(operation: operation))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func addButtonTouchUpInside(_ sender: RoundButton) {
        let operation: Operation = .add
        delegate?.view(self, needPerform: .sendOperation(operation: operation))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func subtractButtonTouchUpInside(_ sender: RoundButton) {
        let operation: Operation = .subtract
        delegate?.view(self, needPerform: .sendOperation(operation: operation))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func multiplyButtonTouchUpInside(_ sender: RoundButton) {
        let operation: Operation = .multiply
        delegate?.view(self, needPerform: .sendOperation(operation: operation))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }

    @IBAction func divideButtonTouchUpInside(_ sender: RoundButton) {
        let operation: Operation = .divide
        delegate?.view(self, needPerform: .sendOperation(operation: operation))
        guard let newResult = datasource?.getResult(_view: self) else {return}
        result = newResult
    }
}

extension CalculatorView {
    enum Action {
        case sendOperation(operation: Operation)
        case sendNumber(number: String)
        case sendDot
        case clear
    }
}
