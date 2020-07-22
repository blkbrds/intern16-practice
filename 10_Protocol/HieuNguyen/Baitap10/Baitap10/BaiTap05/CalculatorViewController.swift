//
//  CalculatorViewController.swift
//  Baitap10
//
//  Created by PCI0020 on 7/13/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet private weak var xTextField: UITextField!
    @IBOutlet private weak var yTextField: UITextField!
    @IBOutlet private weak var questionButton: ExtensionButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func operatorChoiceTouchUpInside(_ sender: Any) {
        if xTextField.text != "" && yTextField.text != "" {
            if let operatorView = Bundle.main.loadNibNamed("OperatorView", owner: self, options: nil)?[0] as? OperatorView {
                operatorView.dataSource = self
                operatorView.delegate = self
                operatorView.layer.borderWidth = 1
                operatorView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                operatorView.frame = CGRect(x: 16, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 36, height: 500)
                view.addSubview(operatorView)
                operatorView.configData()
                UIView.animate(withDuration: 0.5) {
                    operatorView.frame.origin.y = 250
                }                
            }
        }
    }
}

extension CalculatorViewController: OperatorViewDataSource, OperatorViewDelegate {
    func resultView(operatorView: OperatorView, needPerformAction action: OperatorView.Action) {
        switch action {
        case .getResult(let result, let operators):
            resultLabel.text = "= \(String(result))"
            switch operators {
            case 0:
                questionButton.setTitle("+", for: .normal)
            case 1:
                questionButton.setTitle("-", for: .normal)
            case 2:
                questionButton.setTitle("*", for: .normal)
            case 3:
                questionButton.setTitle("/", for: .normal)
            case 4:
                questionButton.setTitle("%", for: .normal)
            case 5:
                questionButton.setTitle("x^y", for: .normal)
            default:
                return
            }
        case .resetValue:
            xTextField.text = ""
            yTextField.text = ""
            return
        }
    }
    
    func getValue(operatorView: OperatorView) -> (String, String) {
        if let x: String = xTextField.text, let y: String = yTextField.text {
            return (x, y)
        }
        return ("","")
    }
}
