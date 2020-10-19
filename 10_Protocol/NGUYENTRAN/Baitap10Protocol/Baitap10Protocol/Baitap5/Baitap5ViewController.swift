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
    
    @IBOutlet weak var xTextField: UITextField!
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
       guard let newsubCalculator = Bundle.main.loadNibNamed("SubCalculator", owner: self, options: nil)?.first as? SubCalculator else { return }
        newsubCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.view.frame.width, height: 500)
        subCalculator = newsubCalculator
        subCalculator.delegate = self
        subCalculator.datasource = self
        view.addSubview(subCalculator)
    }
    
    func toggleCustomView(isHidden: Bool) {
        let window = UIApplication.shared.windows[0]
        let bottomPadding = window.safeAreaInsets.bottom
        if isHidden == false {
            UIView.animate(withDuration: 1.0, delay: 0, options: .transitionCurlUp, animations: {
                self.subCalculator.frame.origin.y = UIScreen.main.bounds.height - 350 - bottomPadding
            }, completion: nil)
            xTextField.isEnabled = false
            yTextField.isEnabled = false
            subCalculator.getXAndY()
        } else {
            UIView.animate(withDuration: 1.0, delay: 0, options: .transitionCurlDown, animations: {
                self.subCalculator.frame.origin.y = UIScreen.main.bounds.height
            }, completion: nil)
            xTextField.isEnabled = true
            yTextField.isEnabled = true
        }
    }

    @IBAction func toggleCalculatorButton(_ sender: UIButton) {
        resultLabel.text?.removeAll()
        if self.subCalculator.frame.origin.y == UIScreen.main.bounds.height {
            if yTextField.text?.trimmingCharacters(in: .whitespaces) == "" || xTextField.text?.trimmingCharacters(in: .whitespaces) == "" {
                xTextField.text?.removeAll()
                yTextField.text?.removeAll()
                resultLabel.text = "Không được để trống giá trị x, y"
                resultLabel.textColor = .red
                return
            } else if xTextField.text?.isNumber == false || yTextField.text?.isNumber == false {
                xTextField.text?.removeAll()
                yTextField.text?.removeAll()
                resultLabel.text = "Nhập số ở giá trị x, y"
                resultLabel.textColor = .red
                return
            }
            toggleCustomView(isHidden: false)
        } else {
            toggleCustomView(isHidden: true)
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
            toggleCustomView(isHidden: true)
        case .tapClear:
            toggleCustomView(isHidden: true)
            xTextField.text?.removeAll()
            yTextField.text?.removeAll()
        case .tapDone(result: let result):
            toggleCustomView(isHidden: true)
            resultLabel.text = result
        }
    }
}

extension Baitap5ViewController: SubCalculatorDataSource {
    func getValue() -> (x: String, y: String)? {
        guard let x = xTextField.text, let y = yTextField.text else { return nil }
        return (x: x, y: y)
    }
}

extension Baitap5ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == xTextField {
            xTextField.resignFirstResponder()
            yTextField.becomeFirstResponder()
        } else {
            yTextField.resignFirstResponder()
        }
        return true
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
