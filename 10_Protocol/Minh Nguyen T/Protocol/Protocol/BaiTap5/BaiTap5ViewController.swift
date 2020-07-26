//
//  BaiTap5ViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap5ViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var xValueTextField: UITextField!
    @IBOutlet private weak var yValueTextField: UITextField!
    @IBOutlet private weak var resultValueLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction private func handleDisplayCalculatorTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            let calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as! CalculatorView
            calculator.frame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 400)
            calculator.dataSource = self
            calculator.delegate = self
            calculator.configView()
            self.view.addSubview(calculator)
        }
    }
}

extension BaiTap5ViewController: CalculatorViewDataSourcs {
    func getValueX() -> Int? {
        guard let xValue = xValueTextField.text else { return 0 }
        return Int(xValue)
    }
    
    func getValueY() -> Int? {
        guard let yValue = yValueTextField.text else { return 0 }
        return Int(yValue)
    }
}

extension BaiTap5ViewController : CalculatorViewDelegate {
    func sendResult(_ controller: CalculatorView, needsPerform action: CalculatorView.Action) {
        switch action {
        case .getResult(resultValue: let resultValue):
            resultValueLabel.text = resultValue
        }
    }
    
    
}
