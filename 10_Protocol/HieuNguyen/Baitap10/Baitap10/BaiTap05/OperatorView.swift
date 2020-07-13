//
//  operatorView.swift
//  Baitap10
//
//  Created by PCI0020 on 7/13/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit
import Foundation

protocol OperatorViewDataSource: class {
    func getValue(operatorView: OperatorView) -> (String, String)
}

protocol OperatorViewDelegate: class {
    func resultView(operatorView: OperatorView, needPerformAction action: OperatorView.Action)
}

class OperatorView: UIView {
    
    enum Action {
        case getResult(result: Int, operators: Int)
        case resetValue
    }

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    weak var dataSource: OperatorViewDataSource?
    weak var delegate: OperatorViewDelegate?
    var x:Int = 0
    var y:Int = 0
    var result: Int = 0
    var senderTag: Int = -1

    func configData() {
        if let dataSource = dataSource {
            let value = dataSource.getValue(operatorView: self)
            xLabel.text = "x = \(value.0)"
            yLabel.text = "y = \(value.1)"
            x = Int(value.0)!
            y = Int(value.1)!
        }
    }
    
    @IBAction func calculatorTouchUpInside(_ sender: UIButton) {
        for case let button as UIButton in self.subviews {
            if button.tag == sender.tag {
                button.backgroundColor = #colorLiteral(red: 0.09213321896, green: 0.6228748381, blue: 0.06000125652, alpha: 0.8470588235)
            } else {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
        
        switch sender.tag {
            case 0:
                result = x + y
                senderTag = 0
                resultLabel.text = String(result)
                return
            case 1:
                result = x - y
                senderTag = 1
                resultLabel.text = String(result)
                return
            case 2:
                result = x * y
                senderTag = 2
                resultLabel.text = String(result)
                return
            case 3:
                result = x / y
                senderTag = 3
                resultLabel.text = String(result)
                return
            case 4:
                result = x % y
                senderTag = 4
                resultLabel.text = String(result)
                return
            case 5:
                result = Int(pow(Double(x),Double(y)))
                senderTag = 5
                resultLabel.text = String(result)
                return
            default:
                return
            }
    }
    
    
    @IBAction func cancelTouchUpInside(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.frame.origin.y = UIScreen.main.bounds.height
        }
    }
    @IBAction func doneTouchUpInside(_ sender: Any) {
        if senderTag != -1 {
            delegate?.resultView(operatorView: self, needPerformAction: .getResult(result: result, operators: senderTag))
            UIView.animate(withDuration: 0.5) {
                self.frame.origin.y = UIScreen.main.bounds.height
            }
        }
        
    }
    @IBAction func clearTouchUpInside(_ sender: Any) {
        delegate?.resultView(operatorView: self, needPerformAction: .resetValue)
        UIView.animate(withDuration: 0.5) {
            self.frame.origin.y = UIScreen.main.bounds.height
        }
    }
}
