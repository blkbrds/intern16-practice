//
//  HomeViewController.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    private var calculatorAction = OperatorAction()
    private var performMath = true
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: Private functions
    private func configView() {
        guard let calculator = Bundle.main.loadNibNamed("CaculatorUIView", owner: self, options: nil)?[0] as? CaculatorUIView else { return }
        calculator.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        calculator.delegate = self
        calculator.datasource = self
        view.addSubview(calculator)
    }

    private func deleteNumber() {
        calculatorAction.deleteNumber()
    }

    private func setNumber(number: String) {
        if performMath {
            var num1: String = calculatorAction.num1 ?? ""
            num1 += number
            calculatorAction.num1 = num1
        } else {
            var num2: String = calculatorAction.num2 ?? ""
            num2 += number
            calculatorAction.num2 = num2
        }
    }

    private func resultCalculator() -> String? {
        guard  let numb1 = calculatorAction.num1, let numb2 = calculatorAction.num2 else { return nil }
        guard let num1 = Float(numb1), let num2 = Float(numb2) , let action = calculatorAction.operatorAction
            else {return nil}
        return String(Caculator.shared.result(num1: num1, num2: num2, operatorAction: action))
    }

    private func getNumber() -> String {
        if performMath {
            guard let num1 = calculatorAction.num1 else { return "" }
            return num1
        } else {
            guard let num2 = calculatorAction.num2  else { return "" }
            return num2
        }
    }
}

// MARK: - CaculatorUIViewDataSource
extension HomeViewController: CaculatorUIViewDataSource {
    func getValueNumber() -> String {
        return getNumber()
    }
    
    func getResult() -> String {
        guard let result = resultCalculator() else { return "" }
        return result
    }
}

// MARK: - CaculatorUIViewDelegate
extension HomeViewController: CaculatorUIViewDelegate {
    func sendData(_ view: CaculatorUIView, needsPerform action: CaculatorUIView.Action) {
        switch action {
        case .cal(operator: let action):
            calculatorAction.operatorAction = calculatorAction.performCalculations(action: action)
            performMath = false
        case .numBer(number: let number):
            setNumber(number: number)
        case .clear:
            deleteNumber()
            performMath = true
        }
    }
}
