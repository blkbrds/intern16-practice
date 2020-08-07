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
    private var calculatorFactory = CalculatorFactory()
    private var isFirstNumber = true
    
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
        if isFirstNumber {
            var num1: String = calculatorFactory.num1 ?? ""
            num1 += stringNumber
            calculatorFactory.num1 = num1
        } else {
            var num2: String = calculatorFactory.num2 ?? ""
            num2 += stringNumber
            calculatorFactory.num2 = num2
        }
    }
    
    private func deleteNumber() {
        calculatorFactory.deleteNumber()
    }
    
    private func returnResult() -> String? {
        guard let num1String = calculatorFactory.num1, let num2String = calculatorFactory.num2 else { return nil }
        guard let num1 = Float(num1String), let num2 = Float(num2String), let op = calculatorFactory.op else { return nil }
        if op == .devide && num2 == 0 { return "NaN" }
        let calculator = Calculator()
        return String(format: "%.2f", calculator.ketQua(num1, num2, op: op))
    }
    
    private func getData() -> String {
        if isFirstNumber {
            guard let num1String = calculatorFactory.num1 else { return "" }
            return num1String
        } else {
            guard let num2String = calculatorFactory.num2 else { return "" }
            return num2String
        }
    }
}

// MARK: - CalculationViewDelegate
extension CalculationViewController: CalculationViewDelegate {
    
    func view(_ view: CalculationView, needsPerform action: CalculationView.Action) {
        switch action {
        case .sendOperator(operator: let op):
            calculatorFactory.op = calculatorFactory.thucHienPhepTinh(phepTinh: op)
            isFirstNumber = false
        case .sendNumber(number: let number):
            saveNumber(with: number)
        case .deleteNumber:
            isFirstNumber = true
            deleteNumber()
        }
    }
}

// MARK: - CalculationViewDatasource
extension CalculationViewController: CalculationViewDatasource {
    
    func getResult(_ view: CalculationView) -> String? {
        isFirstNumber = true
        let result = returnResult()
        deleteNumber()
        return result
    }
    
    func getData(_ view: CalculationView) -> String {
        return getData()
    }
}
