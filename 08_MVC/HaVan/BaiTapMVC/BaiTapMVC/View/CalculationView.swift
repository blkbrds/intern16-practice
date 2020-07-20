//
//  CalculationView.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class CalculationView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var resultTextfield: UILabel!
   
    // MARK: - Properties
    var fullNum: Int = 0
    var firstNum: Float = 0
    var secondNum: Float = 0
    var op: Operator = .plus
    var inputNumber: Float = 0
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    // MARK: - IBActions
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        guard let numberString = sender.titleLabel?.text else { return }
        guard let number = Float(numberString) else { return }
        inputNumber = inputNumber * 10 + number
        if inputNumber < 999999 {
            resultTextfield.text = String(format: "%.0f", inputNumber)
        }
    }
    
    @IBAction func operatorButtonTouchUpInside(_ sender: UIButton) {
        guard let text = resultTextfield.text else { return }
        firstNum = Float(text) ?? 0.0
        op = Calculator.thucHienPhepTinh(phepTinh: sender.currentTitle ?? "+")
        inputNumber = 0
    }
    
    @IBAction func resultButtonTouchUpInside(_ sender: UIButton) {
        guard let text = resultTextfield.text else { return }
        secondNum = Float(text) ?? 0.0
        let calculator = Calculator(firstNum, secondNum)
        print(firstNum)
        print(secondNum)
        print(calculator)
        let ketQua = Calculator.ketQua(calculator, op: op)
        resultTextfield.text = String(format: "%.0f", ketQua)
    }
    
    @IBAction func deleteButtonTouchUpInside(_ sender: UIButton) {
        resultTextfield.text = ""
        inputNumber = 0
        firstNum = 0
        secondNum = 0
    }
}
