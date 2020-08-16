//
//  BaiTap5ViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap5ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var firstNumberTextField: UITextField!
    @IBOutlet private weak var secondNumberTextField: UITextField!
    @IBOutlet private weak var questionMarkButton: UIButton!
    @IBOutlet private weak var finalResultLabel: UILabel!
    
    // MARK: - Propeties
    private var newCalculator = CalculatorCustomView()
    private var state = CalculatorState()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCalculatorCustomView()
        configTextFieldAndLabel()
        configQuestionMarkButton()
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstNumberTextField.resignFirstResponder()
        secondNumberTextField.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func configTextFieldAndLabel() {
        firstNumberTextField.delegate = self
        secondNumberTextField.delegate = self
        finalResultLabel.isHidden = true
    }
    
    private func configQuestionMarkButton() {
        questionMarkButton.layer.cornerRadius = 10
        questionMarkButton.clipsToBounds = true
    }
    
    private func configCalculatorCustomView() {
        guard let calculator = Bundle.main.loadNibNamed("CalculatorCustomView", owner: self, options: nil)?.first as? CalculatorCustomView else { return }
        newCalculator = calculator
        newCalculator.datasource = self
        newCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 350)
        newCalculator.delegate = self
        view.addSubview(newCalculator)
    }
    
    private func hideCalculatorView() {
        UIView.animate(withDuration: 1.0, animations: {
            self.newCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 350)
        }) { _ in
            self.firstNumberTextField.isEnabled = true
            self.secondNumberTextField.isEnabled = true
        }
    }
    
    // MARK: - IBActions
    @IBAction private func questionMarkButtonTouchUpInside(_ sender: UIButton) {
        firstNumberTextField.resignFirstResponder()
        secondNumberTextField.resignFirstResponder()
        if let x = firstNumberTextField.text, let y = secondNumberTextField.text, let xResult = Float(x), let yResult = Float(y) {
            state.setFirstNumber(number: xResult)
            state.setSecondNumber(number: yResult)
        }
        UIView.animate(withDuration: 1.0, animations: {
            self.newCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 350, width: UIScreen.main.bounds.width, height: 350)
        }) { _ in
            self.firstNumberTextField.isEnabled = false
            self.secondNumberTextField.isEnabled = false
            self.newCalculator.configValue()
        }
    }
}

// MARK: - CalculatorCustomViewDatasource
extension BaiTap5ViewController: CalculatorCustomViewDatasource {
    
    func getData() -> (x: Float, y: Float)? {
        if let x = firstNumberTextField.text, let y = secondNumberTextField.text, let xResult = Float(x), let yResult = Float(y) {
            return (xResult, yResult)
        }
        return nil
    }
}

// MARK: - CalculatorCustomViewDelegate
extension BaiTap5ViewController: CalculatorCustomViewDelegate {
    
    func view(_ view: CalculatorCustomView, needsPerform action: CalculatorCustomView.Action) {
        switch action {
        case .deleteXY:
            state.setFirstNumber(number: nil)
            state.setSecondNumber(number: nil)
            firstNumberTextField.text?.removeAll()
            secondNumberTextField.text?.removeAll()
        case .hiddingView:
            hideCalculatorView()
        case .returnResult(result: let result):
            finalResultLabel.isHidden = false
            if let finalResult = result {
                finalResultLabel.text = String(finalResult)
            } else {
                finalResultLabel.text = "Not found"
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap5ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === firstNumberTextField {
            secondNumberTextField.becomeFirstResponder()
        } else {
            newCalculator.configValue()
            firstNumberTextField.resignFirstResponder()
            secondNumberTextField.resignFirstResponder()
        }
        return true
    }
}
