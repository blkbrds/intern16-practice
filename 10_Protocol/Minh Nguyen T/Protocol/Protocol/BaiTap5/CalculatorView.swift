//
//  CalculatorView.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CalculatorViewDataSourcs: class {
    func getValueX() -> Int?
    func getValueY() -> Int?
}

protocol CalculatorViewDelegate: class {
    func sendResult(_ controller: CalculatorView, needsPerform action: CalculatorView.Action)
}

final class CalculatorView: UIView {

    // MARK: - IBOulets
    @IBOutlet private weak var xValueLabel: UILabel!
    @IBOutlet private weak var yValueLabel: UILabel!
    @IBOutlet private weak var resultValueLabel: UILabel!

    // MARK: - Properties
    weak var dataSource: CalculatorViewDataSourcs?
    weak var delegate: CalculatorViewDelegate?
    private var result: Double?

    // MARK: - Functions
    func configView() {
        guard let x = dataSource?.getValueX() , let y = dataSource?.getValueY() else { return }
        xValueLabel.text = String(x)
        yValueLabel.text = String(y)
    }

    // MARK: IBActions
    @IBAction private func handleCancelButton(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 1) {
            self.alpha = 0
        }
    }

    @IBAction private func handleDoneButton(_ sender: UIBarButtonItem) {
        guard let resultFinal = result else { return }
        resultValueLabel.text = String(resultFinal)
        delegate?.sendResult(self, needsPerform: .getResult(resultValue: String(resultFinal)))
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0
        }
    }

    @IBAction private func handleCalculatorButton(_ sender: UIButton) {
        guard let x = dataSource?.getValueX() , let y = dataSource?.getValueY() else { return }
        switch sender.tag {
        case 1:
            result = Double(x + y)
        case 2:
            result = Double(x - y)
        case 3:
            result = Double(x * y)
        case 4:
            if y == 0 {
                result = 0
            } else {
                result = Double(x / y)
            }
        case 5:
            result = Double(x % y)
        case 6:
            result = Double(powf(Float(x), Float(y)))
        default:
            result = 0
        }
        guard let resultFinal = result else { return }
        resultValueLabel.text = String(resultFinal)
    }

    @IBAction private func handleClearButton(_ sender: UIButton) {
        xValueLabel.text = ""
        yValueLabel.text = ""
        resultValueLabel.text = ""
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0
        }
    }
}

extension CalculatorView {
    enum Action {
        case getResult(resultValue: String)
    }
}
