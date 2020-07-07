//
//  CalculatorView.swift
//  BaiTap08
//
//  Created by PCI0020 on 7/7/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class CalculatorView: UIView {

    var operandCurrent:Int = 0
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func operandWasPressed(_ sender: Any) {
        let number:Int = (sender as AnyObject).tag as Int
        let operand = Operand(operand: number)
        operandCurrent = operand.operand
    }

    @IBAction func calculatorWasPressed(_ sender: Any) {
        switch (sender as AnyObject).tag {
            case -4:
                print("phep cong")
            case -3:
                print("phep tru")
            case -2:
                print("phep nhan")
            case -1:
                print("phep chia")
            case 10:
                print("tinh ket qua")
            case 11:
                print("xoa")
        case .none, .some(_):
            return
        }
    }
        override func awakeFromNib() {
            super.awakeFromNib()
            resultView.layer.borderWidth = 1
            resultView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            resultLabel.text = "0 "
        }
    }
