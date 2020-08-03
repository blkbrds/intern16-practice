//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by bu on 7/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    private var operatorView = Bundle.main.loadNibNamed("OperatorView", owner: self, options: nil)?.first as? OperatorView
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Calculator"
        if let operatorView = operatorView {
            operatorView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 307)
            operatorView.dataSource = self
            operatorView.delegate = self
            view.addSubview(operatorView)
        }
    }
    
    private func slideUp() {
        UIView.animate(withDuration: 0.5) {
            let frame = CGRect(x: 0, y: self.view.bounds.height - 307, width: self.view.bounds.width, height: 307)
            self.operatorView?.frame = frame
        }
    }
    
    private func slideDown() {
        UIView.animate(withDuration: 0.5) {
            let frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: 307)
            self.operatorView?.frame = frame
        }
    }
    
    // MARK: - Action
    @IBAction private func operatorTouchUpInside(_ sender: UIButton) {
        view.endEditing(true)
        number2TextField.resignFirstResponder()
        slideUp()
    }
    
}

// MARK: - Extension
extension CalculatorViewController: OperatorViewDataSource, OperatorViewDelegate {
    func getNumber1(operatorView: OperatorView) -> Int! {
        return Int(number1TextField.text!)
    }
    
    func getNumber2(operatorView: OperatorView) -> Int! {
        return Int(number2TextField.text!)
    }
    
    func view(_ view: OperatorView, needsPerform action: OperatorView.Action) {
        switch action {
        case .done(result: let result):
            resultLabel.text = "\(result)"
        case .clear:
            number1TextField.text = ""
            number2TextField.text = ""
            resultLabel.text = ""
        case .cancel:
            break
        }
        slideDown()
    }
}
