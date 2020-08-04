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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCalculatorCustomView()
        configTextFieldAndLabel()
        configQuestionMarkButton()
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
        })
    }
    
    // MARK: - IBActions
    @IBAction private func questionMarkButtonTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.newCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 350, width: UIScreen.main.bounds.width, height: 350)
        })
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
            firstNumberTextField.text?.removeAll()
            secondNumberTextField.text?.removeAll()
        case .hiddingView:
            hideCalculatorView()
        case .returnResult(result: let result):
            finalResultLabel.isHidden = false
            finalResultLabel.text = String(format: "%.2f", result)
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
