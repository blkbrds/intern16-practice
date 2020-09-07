//
//  CalculateViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 8/4/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class CalculateViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var numberXTextField: UITextField!
    @IBOutlet private weak var numberYTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var mathButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction func mathButtonTouchUpInside(_ sender: Any) {
        guard let customViewCalculate = Bundle.main.loadNibNamed("CustomViewCalculate", owner: self, options: nil)?.first as? CustomViewCalculate else { return }
        customViewCalculate.frame = CGRect(x: 70, y: 300, width: 260, height: 289)
        customViewCalculate.dataSource = self
        customViewCalculate.delegate = self
        view.addSubview(customViewCalculate)
    }
}
// MARK: - Extension CalculatorDataSource, CalculatorDelegate
extension CalculateViewController: CalculatorDataSource {

    func getNumberX() -> Int? {
        guard let x = numberXTextField.text else { return 0 }
        return Int(x)
    }

    func getNumberY() -> Int? {
        guard let y = numberYTextField.text else { return 0 }
        return Int(y)
    }
}

extension CalculateViewController: CalculatorDelegate {

    func updateValue(_ customViewCalculte: CustomViewCalculate, needPerform action: CustomViewCalculate.Action) {
        switch action {
        case .clearButton:
            numberXTextField.text = ""
            numberYTextField.text = ""
        case .doneButton(resultText: let result):
            resultLabel.text = result
        case .cancelButton:
            break
        }
        customViewCalculte.isHidden = true
    }
}

