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
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var questionMarkButton: UIButton!
    @IBOutlet weak var calculatorView: UIView!
    // MARK: - Propeties
    var newCalculator = CalculatorCustomView()
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCalculatorCustomView()
        firstNumberTextField.delegate = self
        secondNumberTextField.delegate = self
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configCalculatorCustomView() {
        guard let calculator = Bundle.main.loadNibNamed("CalculatorCustomView", owner: self, options: nil)?.first as? CalculatorCustomView else { return }
        newCalculator = calculator
        newCalculator.datasource = self
        newCalculator.frame = CGRect(x: 0, y: 0, width: calculatorView.bounds.width, height: calculatorView.bounds.height)
        calculatorView.addSubview(newCalculator)
//        newCalculator.datasource = self
        calculatorView.alpha = 0
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
    @IBAction func questionMarkButtonTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
            self.calculatorView.alpha = 1
        }, completion: nil)
        
    }
}
extension BaiTap5ViewController: CalculatorCustomViewDatasource {
    func getData() -> (x: Float, y: Float)? {
         if let x = firstNumberTextField.text, let y = secondNumberTextField.text, let xResult = Float(x), let yResult = Float(y) {
                   return (xResult, yResult)
               }
           return nil
           }
    }

extension BaiTap5ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === firstNumberTextField {
            secondNumberTextField.becomeFirstResponder()
        } else {
            newCalculator.configValue()
        }
        return true
    }
}
