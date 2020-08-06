//
//  CalculationViewController.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class CalculationViewController: UIViewController {
    
    // MARK: - Properties
    private var op: String?
    private var num1: String?
    private var num2: String?
    private var isNum = true
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private functions
    private func configView() {
        guard let newCalculator = Bundle.main.loadNibNamed("CalculationView", owner: self, options: nil)?.first as? CalculationView else { return }
        newCalculator.delegate = self
        newCalculator.datasource = self
        view.addSubview(newCalculator)
    }
    
    private func saveNumber(with stringNumber: String) {
        if isNum {
            var num1: String = self.num1 ?? ""
            num1 += stringNumber
            self.num1 = num1
        } else {
            var num2: String = self.num2 ?? ""
            num2 += stringNumber
            self.num2 = num2
        }
    }
    
    private func deleteNumber() {
        num1 = nil
        num2 = nil
    }
    
    private func returnResult() -> String? {
        guard let num1String = num1, let num2String = num2 else { return nil }
        guard let num1 = Float(num1String), let num2 = Float(num2String), let op = op else { return nil }
        let calculator = Calculator()
        let newOP: Operator = calculator.thucHienPhepTinh(phepTinh: op)
        if newOP == .devide && num2 == 0 { return "NaN" }
        return String(format: "%.2f", calculator.ketQua(num1, num2, op: newOP))
    }
    
    private func getData() -> String {
        if isNum {
            guard let num1String = num1 else { return "" }
            return num1String
        } else {
            guard let num2String = num2 else { return "" }
            return num2String
        }
    }
}

// MARK: - CalculationViewDelegate
extension CalculationViewController: CalculationViewDelegate {
    
    func view(_ view: CalculationView, needsPerform action: CalculationView.Action) {
        switch action {
        case .sendOperator(operator: let op):
            self.op = op
            isNum = false
        case .sendNumber(number: let number):
            saveNumber(with: number)
        case .deleteNumber:
            isNum = true
            deleteNumber()
        }
    }
}

// MARK: - CalculationViewDatasource
extension CalculationViewController: CalculationViewDatasource {
    
    func getResult(_ view: CalculationView) -> String? {
        isNum = true
        let result = returnResult()
        deleteNumber()
        return result
    }
    
    func getData(_ view: CalculationView) -> String {
        return getData()
        
    }
}
