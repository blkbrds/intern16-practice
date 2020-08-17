//
//  Bai5ViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/26/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai5ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var numberXTextField: UITextField!
    @IBOutlet private weak var numberYTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var mathButton: UIButton!
    
    // MARK: - IBActions
    @IBAction private func appearButtonTouchUpInside(_sender: UIButton) {
        guard let calculatorCustom = Bundle.main.loadNibNamed("Calculator", owner: self, options: nil)?.first as? Calculator else { return }
        calculatorCustom.frame = CGRect(x: 20, y: 250, width: 300, height: 300)
        calculatorCustom.dataSource = self
        calculatorCustom.delegate = self
        view.addSubview(calculatorCustom)
    }
}

// MARK : - Extension CalculatorDataSource, CalculatorDelegate
extension Bai5ViewController: CalculatorDataSource {
    
    func getNumberX() -> Int? {
        guard let x = numberXTextField.text else { return 0 }
        return Int(x)
    }
    
    func getNumberY() -> Int? {
        guard let y = numberYTextField.text else { return 0 }
        return Int(y)
    }
}

extension Bai5ViewController: CalculatorDelegate {
    
    func updateResult(view: Calculator, need action: Calculator.Action) {
        switch action {
        case .clearButton(let clearText):
            numberXTextField.text = clearText
            numberYTextField.text = clearText
        case .doneButton(let resultText, let mathText):
            resultLabel.text = resultText
        }
    }
}
