//
//  CalculatorCustomView.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol CalculatorCustomViewDatasource: class {
    func getData() -> (x: Float, y: Float)?
}

protocol CalculatorCustomViewDelegate: class {
    func view(_ view: CalculatorCustomView, needsPerform action: CalculatorCustomView.Action)
}

final class CalculatorCustomView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var powerButton: UIButton!
    @IBOutlet private weak var percentButton: UIButton!
    @IBOutlet private weak var  devideButton: UIButton!
    @IBOutlet private weak var multipleButton: UIButton!
    @IBOutlet private weak var minorButton: UIButton!
    @IBOutlet private weak var xValueLabel: UILabel!
    @IBOutlet private weak var yValueLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var controlButtonsView: UIView!
    
    // MARK: - Propeties
    weak var datasource: CalculatorCustomViewDatasource?
    weak var delegate: CalculatorCustomViewDelegate?
    private var firstNum: Float?
    private var secondNum: Float?
    private var result: Float = 0

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configButton()
        configValue()
        setInitialValueLabel()
    }

    // MARK: - Private functions
    private func setInitialValueLabel() {
        xValueLabel.isHidden = true
        yValueLabel.isHidden = true
        resultLabel.isHidden = true
    }
    
    private func showValueLabel() {
        xValueLabel.isHidden = false
        yValueLabel.isHidden = false
    }
    private func setInitialStateButton(button: UIButton) {
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.clipsToBounds = true
    }
    
    private func configButton() {
        setInitialStateButton(button: plusButton)
        setInitialStateButton(button: minorButton)
        setInitialStateButton(button: devideButton)
        setInitialStateButton(button: powerButton)
        setInitialStateButton(button: multipleButton)
        setInitialStateButton(button: percentButton)
        controlButtonsView.layer.borderWidth = 1
        controlButtonsView.layer.borderColor = UIColor.blue.cgColor
        clearButton.layer.cornerRadius = 15
        
    }
    
    private func changeButtonState(button: UIButton) {
        configButton()
            button.backgroundColor = .orange
            button.setTitleColor(.white, for: .normal)
    }
    
     func configValue() {
        showValueLabel()
        guard let x = getXY()?.x, let y = getXY()?.y else {
            xValueLabel.text = ""
            yValueLabel.text = ""
            return
        }
        xValueLabel.text = String(x)
        yValueLabel.text = String(y)
    }
    
    func getXY() -> (x: Float, y: Float)? {
        guard let result = datasource?.getData() else { return nil }
        return (result.x, result.y)
    }
    
    private func calculate(buttonName: String, firstNumber: Float, secondNumber: Float) -> Float {
        let toantu = Calculator(firstNumber, secondNumber)
        return Calculator.ketQua(toantu, op: Calculator.thucHienPhepTinh(phepTinh: buttonName))
    }

    // MARK: - IBActions
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        changeButtonState(button: sender)
        guard let getXY = datasource?.getData() else { return }
        guard let phepTinh = sender.currentTitle else { return }
        result = calculate(buttonName: phepTinh, firstNumber: getXY.x, secondNumber: getXY.y)
        resultLabel.isHidden = false
        resultLabel.text = String(format: "%.2f", result)
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        xValueLabel.text = ""
        yValueLabel.text = ""
        resultLabel.text = ""
        delegate?.view(self, needsPerform: .hiddingView)
        delegate?.view(self, needsPerform: .deleteXY)
    }
    
    @IBAction private func doneButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needsPerform: .returnResult(result: result))
        delegate?.view(self, needsPerform: .hiddingView)
    }
    
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needsPerform: .hiddingView)
    }
}

// MARK: - Extension
extension CalculatorCustomView {
    enum TransData {
        case transXAndY(x: Float, y: Float)
    }
    enum Action {
        case returnResult(result: Float)
        case hiddingView
        case deleteXY
    }
}
