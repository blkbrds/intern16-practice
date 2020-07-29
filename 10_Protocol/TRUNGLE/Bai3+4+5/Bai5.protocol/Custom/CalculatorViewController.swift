
//
//  CalculatorViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

protocol CalculatorViewControllerDataSource: class {
    func getValueX() -> Int?
    func getValueY() -> Int?
}

protocol CalculatorViewControllerDelegate: class {
    func calculateView(view: CalculatorViewController, needPerformAction action: CalculatorViewController.action)
}

final class CalculatorViewController: UIView {
    
    weak var dataSource: CalculatorViewControllerDataSource?
    weak var delegate: CalculatorViewControllerDelegate?
    
    enum action {
        case doneAction(resultText: String?)
        case clearAction(clearText: String?)
    }
    @IBOutlet weak var xResultLabel: UILabel!
    @IBOutlet weak var yResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    private var x: Int?
    private var y: Int?
    private var result: Double?
    
    func configView() {
        guard let x = dataSource?.getValueX(), let y = dataSource?.getValueY() else { return }
        xResultLabel.text = String(x)
        yResultLabel.text = String(y)
    }
    
    @IBAction private func calculartorAction(_ sender: UIButton) {
        guard let x = dataSource?.getValueX(), let y = dataSource?.getValueY() else { return }
        
        switch sender.tag {
        case 0:
            result = Double(x + y)
        case 1:
            result = Double(x - y)
        case 2:
            result = Double(x * y)
        case 3:
            result = Double(x / y)
        case 4:
            result = Double(x % y)
        case 5:
            result = Double(pow(Double(x), Double(y)))
        default:
            clearButtonTouchUpInside(self)
        }
        
        guard let result = result else { return }
        resultLabel.text = String(result)
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        xResultLabel.text = ""
        yResultLabel.text = ""
        if let delegate = delegate {
            delegate.calculateView(view: self, needPerformAction: .clearAction(clearText: ""))
        }
    }
    
    @IBAction private func cannelActionTouchUpInside(_ sender: Any) {
        self.isHidden = true
    }
    
    @IBAction private func completeButtonTouchUpInside(_ sender: Any) {
        self.isHidden = true
        guard let result = result else { return }
        if let delegate = delegate {
            delegate.calculateView(view: self, needPerformAction: .doneAction(resultText: String(result)))
        }
    }
}



