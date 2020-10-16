//
//  Baitap5ViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap5ViewController: UIViewController {
    
    var subCalculator = SubCalculator()
    
    @IBOutlet weak var xTexTField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubCalculatorView()
        resultLabel.clipsToBounds = true
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.text = ""
    }

    func configSubCalculatorView() {
        let window = UIApplication.shared.windows[0]
        let bottomPadding = window.safeAreaInsets.bottom

        guard let newsubCalculator = Bundle.main.loadNibNamed("SubCalculator", owner: self, options: nil)?.first as? SubCalculator else { return }
        subCalculator = newsubCalculator
        subCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - bottomPadding - 270, width: UIScreen.main.bounds.width, height: 270)
        subCalculator.layer.borderWidth = 1.0
        subCalculator.layer.borderColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        let border = CALayer()
        border.backgroundColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        border.frame = CGRect(x: 0, y: 43, width: UIScreen.main.bounds.width, height: 1.0)
        subCalculator.layer.addSublayer(border)
        subCalculator.delegate = self
        subCalculator.datasource = self
        view.addSubview(subCalculator)
        subCalculator.isHidden = true
    }

    @IBAction func toggleCalculatorButton(_ sender: UIButton) {
        if subCalculator.isHidden {
            subCalculator.isHidden = false
            xTexTField.isEnabled = false
            yTextField.isEnabled = false
        } else {
            subCalculator.isHidden = true
            xTexTField.isEnabled = true
            yTextField.isEnabled = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension Baitap5ViewController: SubCalculatorDelegate {
    func send(_ view: SubCalculator, needsPerform action: SubCalculator.Action) {
        switch action {
        case .tapCancel:
            subCalculator.isHidden = true
            xTexTField.isEnabled = true
            yTextField.isEnabled = true
        case .tapClear:
            subCalculator.isHidden = true
            xTexTField.isEnabled = true
            yTextField.isEnabled = true
            xTexTField.text?.removeAll()
            yTextField.text?.removeAll()
        case .tapDone(result: let result):
            subCalculator.isHidden = true
            xTexTField.isEnabled = true
            yTextField.isEnabled = true
            resultLabel.text = result
        }
    }
}

extension Baitap5ViewController: SubCalculatorDataSource {
    func getValue(_ view: SubCalculator) -> (String?, String?) {
        guard let x = xTexTField.text, let y = yTextField.text else {
            xTexTField.text?.removeAll()
            yTextField.text?.removeAll()
            resultLabel.text = "Không được để trống giá trị x, y"
            resultLabel.textColor = .red
            return ("","")
        }
        return (x,y)
    }
}

extension Baitap5ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == xTexTField {
            xTexTField.resignFirstResponder()
            yTextField.becomeFirstResponder()
        } else {
            yTextField.resignFirstResponder()
        }
        return true
    }
}
